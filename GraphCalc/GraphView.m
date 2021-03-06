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
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)dealloc
{
    self.delegate = nil;
    [super dealloc];
}

- (int)yFromX:(int)x withCenter:(CGPoint)center andScale:(int)scale
{
    return -[self.delegate YValueForX:(x - center.x) / scale] * scale + center.y;
}

- (void)drawRect:(CGRect)rect
{
    int scale = self.delegate.scale;
    CGPoint center = self.delegate.origin;
    center.x += self.bounds.size.width / 2 + self.bounds.origin.x;
    center.y += self.bounds.size.height / 2 + self.bounds.origin.y;
    [AxesDrawer drawAxesInRect:self.bounds originAtPoint:center scale:scale];
    
	CGContextRef context = UIGraphicsGetCurrentContext();
	UIGraphicsPushContext(context);
	CGContextBeginPath(context);
    CGFloat points = self.bounds.size.width;
    CGFloat pixels = points * self.contentScaleFactor;
    CGContextMoveToPoint(context, 0, 0);
    
    CGFloat yPixel = [self yFromX:0 withCenter:center andScale:scale];
    CGContextMoveToPoint(context, 0, yPixel);
    for (CGFloat xPixel = 1; xPixel < pixels; xPixel++)
    {
        yPixel = [self yFromX:xPixel withCenter:center andScale:scale];
        if (yPixel == INFINITY)
        {
            yPixel = MAXFLOAT;
        }
        if (yPixel == -INFINITY)
        {
            yPixel = -MAXFLOAT;
        }
        CGContextAddLineToPoint(context, xPixel, yPixel);
    }
    CGContextStrokePath(context);
}

@end
