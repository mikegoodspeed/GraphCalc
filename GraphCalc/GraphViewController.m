//
//  GraphViewController.m
//  GraphCalc
//
//  Created by Mike Goodspeed on 5/21/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import "GraphViewController.h"
#import "AxesDrawer.h"

@implementation GraphViewController

@synthesize graphView = graphView_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    self.graphView = nil;
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)updateUI
{
    //[AxesDrawer drawAxesInRect:self.view.bounds originAtPoint:self.view.center scale:14];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateUI];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.graphView = nil;
}

#pragma mark - Implementation

- (IBAction)zoomIn
{
    
}

- (IBAction)zoomOut
{
    
}

@end
