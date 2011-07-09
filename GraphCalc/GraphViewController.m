//
//  GraphViewController.m
//  GraphCalc
//
//  Created by Mike Goodspeed on 5/21/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import "GraphViewController.h"
#import "CalculatorBrain.h"

@interface GraphViewController ()
- (void)updateUI;
@end

@implementation GraphViewController

@synthesize graphView = graphView_;
@synthesize scale = scale_;
@synthesize origin = origin_;
@synthesize expression = expression_;

- (void)setScale:(int)scale
{
    if (scale < 1)
        scale = 1;
    scale_ = scale;
    [self updateUI];
}

- (void)setOrigin:(CGPoint)origin
{
    origin_ = origin;
    [self updateUI];
}

- (void)setExpression:(id)expression
{
    [expression_ release];
    expression_ = [expression retain];
    [self updateUI];
}

- (void)dealloc
{
    [graphView_ release];
    [expression_ release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)loadView
{
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    GraphView *gv = [[GraphView alloc] initWithFrame:frame];
    gv.delegate = self;
    self.graphView = gv;
    self.view = gv;
    [gv release];
}

- (void)updateUI
{
    [self.graphView setNeedsDisplay];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.graphView.delegate = self;
    self.scale = 14;
    
    UIPanGestureRecognizer *pan = 
        [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(pan:)];
    [self.graphView addGestureRecognizer:pan];
    
    UIPinchGestureRecognizer *pinch = 
        [[UIPinchGestureRecognizer alloc] initWithTarget:self
                                                  action:@selector(pinch:)];
    [self.graphView addGestureRecognizer:pinch];
    
    UITapGestureRecognizer *tap =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(tap:)];
    tap.numberOfTapsRequired = 2;
    [self.graphView addGestureRecognizer:tap];

    [pan release];
    [pinch release];
    [tap release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.graphView = nil;
}

#pragma mark - Implementation

- (double)YValueForX:(double)x
{
    NSNumber *number = [[NSNumber alloc] initWithDouble:x];
    NSDictionary *vars = [[NSDictionary alloc]
                          initWithObjectsAndKeys:number, @"x", nil];
    double value = [CalculatorBrain evaluateExpression:self.expression 
                                        usingVariables:vars];
    [number release];
    [vars release];
    return value;
}

#pragma mark - UISplitViewController

- (void)splitViewController:(UISplitViewController *)svc 
     willHideViewController:(UIViewController *)aViewController 
          withBarButtonItem:(UIBarButtonItem *)barButtonItem 
       forPopoverController:(UIPopoverController *)pc
{
    barButtonItem.title = aViewController.title;
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

- (void)splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.navigationItem.leftBarButtonItem = nil;
}

#pragma mark - Gestures

- (void)pan:(UIPanGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateChanged ||
        recognizer.state == UIGestureRecognizerStateEnded)
    {
        CGPoint new = [recognizer translationInView:self.graphView];
        self.origin = CGPointMake(self.origin.x + new.x,
                                  self.origin.y + new.y);
        [recognizer setTranslation:CGPointZero inView:self.graphView];
    }
}

- (void)pinch:(UIPinchGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateBegan ||
        recognizer.state == UIGestureRecognizerStateEnded)
    {
        lastScale_ = self.scale;
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged)
    {
        self.scale = lastScale_ * recognizer.scale;
    }
}

- (void)tap:(UITapGestureRecognizer *)recognizer
{
    self.origin = CGPointZero;
    self.scale = 14;
}

#pragma mark - Orientation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

@end
