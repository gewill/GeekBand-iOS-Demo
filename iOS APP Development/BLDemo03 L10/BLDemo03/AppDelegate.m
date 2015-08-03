//
//  AppDelegate.m
//  BLDemo03
//
//  Created by Will Ge on 7/28/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "AppDelegate.h"
#import "BLOneViewController.h"
#import "BLTwoViewController.h"
#import "BLThreeViewController.h"
#import "BLFourViewController.h"
#import "BLFiveViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


#pragma mark - Custom methods

- (void)loadMainFrame
{
    //  Navigation Controller one
    BLOneViewController *oneViewController = [[BLOneViewController alloc] init];
    UINavigationController *oneNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:oneViewController];
    oneNavigationController.tabBarItem.title = @"one";
    oneNavigationController.tabBarItem.image = [UIImage imageNamed:@"one"];
    // 设置不透明后视图原点下移
    oneNavigationController.navigationBar.translucent = NO;
    
    //  Navigation Controller two
    BLTwoViewController *twoViewController = [[BLTwoViewController alloc] init];
    UINavigationController *twoNavigationcontroller = [[UINavigationController alloc]
                                                       initWithRootViewController:twoViewController];
    twoNavigationcontroller.tabBarItem.title = @"two";
    twoNavigationcontroller.tabBarItem.image = [UIImage imageNamed:@"two"];
    
    //  Navigation Controller three
    BLThreeViewController *threeViewController = [[BLThreeViewController alloc] init];
    UINavigationController *threeNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:threeViewController];
    threeNavigationController.tabBarItem.title = @"three";
    threeNavigationController.tabBarItem.image = [UIImage imageNamed:@"three"];
    
    //  Navigation Controller four
    BLFourViewController *fourViewController = [[BLFourViewController alloc] init];
    UINavigationController *fourNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:fourViewController];
    fourNavigationController.tabBarItem.title = @"four";
    fourNavigationController.tabBarItem.image = [UIImage imageNamed:@"four"];
    
    //  Navigation Controller five
    BLFiveViewController *fiveViewController = [[BLFiveViewController alloc] init];
    UINavigationController *fiveNavigationcontroller = [[UINavigationController alloc]
                                                       initWithRootViewController:fiveViewController];
    fiveNavigationcontroller.tabBarItem.title = @"five";
    fiveNavigationcontroller.tabBarItem.image = [UIImage imageNamed:@"five"];
    
    
    //  TabBarController
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
//    NSArray *viewControllers = [NSArray arrayWithObjects:oneNavigationcontroller, nil];
//    NSDictionary *dic = @{@"name":@"zhangsan", @"age":@30};
    [tabBarController setViewControllers:@[oneNavigationController,
                                           twoNavigationcontroller,
                                           threeNavigationController,
                                           fourNavigationController,
                                           fiveNavigationcontroller]];
    
    self.window.rootViewController = tabBarController;
    
    
    //  UIDevice UIScreen AppDelegate useage
    UIDevice *currentDevice = [UIDevice currentDevice];
    NSLog(@"%@", currentDevice.systemVersion);
    
    UIScreen *currentScreen = [UIScreen mainScreen];
    NSLog(@"%@", NSStringFromCGRect(currentScreen.bounds));
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
   
}

#pragma mark - Application lifecycle methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self loadMainFrame];
    
    [self.window makeKeyAndVisible];
    
  
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
