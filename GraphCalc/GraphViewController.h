//
//  GraphViewController.h
//  GraphCalc
//
//  Created by Mike Goodspeed on 5/21/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphView.h"

@interface GraphViewController : UIViewController 
    <GraphViewDelegate, UISplitViewControllerDelegate>
{
    GraphView *graphView_;
    int scale_;
    int lastScale_;
    CGPoint origin_;
    id expression_;
}

@property (nonatomic, retain) id expression;
@property (nonatomic, retain) IBOutlet GraphView *graphView;
@end
