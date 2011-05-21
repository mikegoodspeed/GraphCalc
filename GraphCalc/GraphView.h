//
//  GraphView.h
//  GraphCalc
//
//  Created by Mike Goodspeed on 5/21/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GraphView;

@protocol GraphViewDelegate
@property (nonatomic) int scale;
- (double)YValueForX:(double)x;
@end


@interface GraphView : UIView
{
    id <GraphViewDelegate> delegate_;
}

@property (nonatomic, assign) id <GraphViewDelegate> delegate;

@end
