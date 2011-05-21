//
//  GraphViewController.h
//  GraphCalc
//
//  Created by Mike Goodspeed on 5/21/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphView.h"

@interface GraphViewController : UIViewController {
    GraphView *graphView_;
}

- (IBAction)zoomIn;
- (IBAction)zoomOut;

@property (nonatomic, retain) IBOutlet GraphView *graphView;

@end
