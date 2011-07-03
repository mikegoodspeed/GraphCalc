//
//  GraphCalcAppDelegate.m
//  GraphCalc
//
//  Created by Mike Goodspeed on 5/21/11.
//  Copyright 2011 Mike Goodspeed. All rights reserved.
//

#import "GraphCalcAppDelegate.h"
#import "CalculatorViewController.h"
#import "GraphViewController.h"

@implementation GraphCalcAppDelegate

@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    BOOL iPad = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
    if (iPad)
    {
        UINavigationController *mainNav = [[UINavigationController alloc] init];
        CalculatorViewController *main = [[CalculatorViewController alloc] init];
        [mainNav pushViewController:main animated:NO];
        UINavigationController *detailNav = [[UINavigationController alloc] init];
        GraphViewController *detail = [[GraphViewController alloc] init];
        [detailNav pushViewController:detail animated:NO];
        svc_ = [[UISplitViewController alloc] init];
        svc_.viewControllers = [NSArray arrayWithObjects:mainNav, detailNav, nil];
        svc_.delegate = detail;
        [self.window addSubview:svc_.view];
        [main release];
        [detail release];
        [mainNav release];
        [detailNav release];
    }
    else
    {
        nc_ = [[UINavigationController alloc] init];
        CalculatorViewController *cvc = [[CalculatorViewController alloc] init];
        [nc_ pushViewController:cvc animated:NO];
        [self.window addSubview:nc_.view];
        [cvc release];
    }
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
    [svc_ release];
    [nc_ release];
    [_window release];
    [super dealloc];
}

@end
