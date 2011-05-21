//
//  GraphViewController.m
//  GraphCalc
//
//  Created by Mike Goodspeed on 5/21/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import "GraphViewController.h"

@interface GraphViewController ()
- (void)updateUI;
@end

@implementation GraphViewController

@synthesize graphView = graphView_;
@synthesize scale = scale_;

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

- (int)YValueForX:(int)x
{
    return 7;
}

@end
