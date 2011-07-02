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
@synthesize expression = expression_;

- (void)setScale:(int)scale
{
    if (scale < 1)
        scale = 1;
    scale_ = scale;
    [self updateUI];
}

- (void)dealloc
{
    [graphView_ release];
    [expression_ release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)updateUI
{
    [self.graphView setNeedsDisplay];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.graphView.delegate = self;
    self.scale = 14;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.graphView = nil;
}

#pragma mark - Implementation

- (IBAction)zoomIn
{
    self.scale++;
}

- (IBAction)zoomOut
{
    self.scale--;
}

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

- (void)splitViewForController:(UISplitViewController *)sv
        willHideViewController:(UIViewController *)aViewController
             withBarButtonItem:(UIBarButtonItem *)barButtonItem
          forPopoverController:(UIPopoverController *)popover
{
    barButtonItem.title = aViewController.title;
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

@end
