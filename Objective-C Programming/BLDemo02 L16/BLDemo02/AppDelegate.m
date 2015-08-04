//
//  AppDelegate.m
//  BLDemo02
//
//  Created by Will Ge on 8/3/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - Custom NSNotificationCenter method

- (void)receivDragonViewNotification:(NSNotification *)nofication {
    NSDictionary *userInfo = nofication.userInfo;
    NSLog(@"name is %@", [userInfo valueForKey:@"name"]);
}



#pragma mark - Application lifecycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // add a notification
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receivDragonViewNotification:)
                                                 name:@"BLDragonViewNotification"
                                               object:nil];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
