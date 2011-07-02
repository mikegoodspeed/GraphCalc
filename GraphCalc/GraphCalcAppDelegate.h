//
//  GraphCalcAppDelegate.h
//  GraphCalc
//
//  Created by Mike Goodspeed on 5/21/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraphCalcAppDelegate : NSObject <UIApplicationDelegate>
{
    UISplitViewController *svc_;
    UINavigationController *nc_;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
