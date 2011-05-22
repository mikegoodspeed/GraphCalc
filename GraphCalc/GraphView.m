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
    CGPoint center = CGPointMake(0, 0);
    center.x = self.bounds.size.width / 2 + self.bounds.origin.x;
    center.y = self.bounds.size.height / 2 + self.bounds.origin.y;
    [AxesDrawer drawAxesInRect:self.bounds originAtPoint:center scale:scale];
    
	CGContextRef context = UIGraphicsGetCurrentContext();
	UIGraphicsPushContext(context);
	CGContextBeginPath(context);
    CGFloat points = self.bounds.size.width;
    CGFloat pixels = points * self.contentScaleFactor;
    CGContextMoveToPoint(context, 0, 0);
    
    CGFloat xPoint, yPoint;
    double y;
    for (double x = self.bounds.origin.x + 1; x < pixels; x++)
    {
        y = [self.delegate YValueForX:x];
        xPoint = x / self.contentScaleFactor;
        yPoint = self.bounds.size.height - (y / self.contentScaleFactor);
        CGContextAddLineToPoint(context, xPoint, yPoint);
    }
    CGContextStrokePath(context);
}


- (void)dealloc
{
    self.delegate = nil;
    [super dealloc];
}

@end
