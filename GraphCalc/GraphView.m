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
    
    CGContextMoveToPoint(context, 0, -[self.delegate YValueForX:(0 - center.x) / scale] * scale + center.y);
    for (CGFloat xPixel = 1; xPixel < pixels; xPixel++)
    {
        CGFloat yPixel = -[self.delegate YValueForX:(xPixel - center.x) / scale] * scale + center.y;
        if (yPixel == INFINITY)
            yPixel = MAXFLOAT;
        if (yPixel == -INFINITY)
            yPixel = -MAXFLOAT;
        CGContextAddLineToPoint(context, xPixel, yPixel);
    }
    CGContextStrokePath(context);
}

- (void)dealloc
{
    self.delegate = nil;
    [super dealloc];
}

@end
