//
//  GraphCalcAppDelegate.m
//  GraphCalc
//
//  Created by Mike Goodspeed on 5/21/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import "GraphCalcAppDelegate.h"
#import "CalculatorViewController.h"

@implementation GraphCalcAppDelegate

@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UINavigationController *navcon = [[UINavigationController alloc] init];
    CalculatorViewController *cvc = [[CalculatorViewController alloc] init];
    [navcon pushViewController:cvc animated:NO];
    [cvc release];
    [self.window addSubview:navcon.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
