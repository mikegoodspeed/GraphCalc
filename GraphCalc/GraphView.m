//
//  GraphView.m
//  GraphCalc
//
//  Created by Mike Goodspeed on 5/21/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import "GraphView.h"
#import "AxesDrawer.h"

@implementation GraphView

@synthesize delegate = delegate_;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    int scale = self.delegate.scale;
    [AxesDrawer drawAxesInRect:self.bounds originAtPoint:self.center scale:scale];
}


- (void)dealloc
{
    self.delegate = nil;
    [super dealloc];
}

@end
