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
#import <dlfcn.h>

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
    UINavigationController *twoNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:twoViewController];
    twoNavigationController.tabBarItem.title = @"two";
    twoNavigationController.tabBarItem.image = [UIImage imageNamed:@"two"];
    twoNavigationController.navigationBar.translucent = NO;
    
    //  Navigation Controller three
    BLThreeViewController *threeViewController = [[BLThreeViewController alloc] init];
    UINavigationController *threeNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:threeViewController];
    threeNavigationController.tabBarItem.title = @"three";
    threeNavigationController.tabBarItem.image = [UIImage imageNamed:@"three"];
    threeNavigationController.navigationBar.translucent = NO;
    
    //  Navigation Controller four
    BLFourViewController *fourViewController = [[BLFourViewController alloc] init];
    UINavigationController *fourNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:fourViewController];
    fourNavigationController.tabBarItem.title = @"four";
    fourNavigationController.tabBarItem.image = [UIImage imageNamed:@"four"];
    fourNavigationController.navigationBar.translucent = NO;
    
    //  Navigation Controller five
    BLFiveViewController *fiveViewController = [[BLFiveViewController alloc] init];
    UINavigationController *fiveNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:fiveViewController];
    fiveNavigationController.tabBarItem.title = @"five";
    fiveNavigationController.tabBarItem.image = [UIImage imageNamed:@"five"];
    fiveNavigationController.navigationBar.translucent = NO;
    
    
    //  TabBarController
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
//    NSArray *viewControllers = [NSArray arrayWithObjects:oneNavigationcontroller, nil];
//    NSDictionary *dic = @{@"name":@"zhangsan", @"age":@30};
    [tabBarController setViewControllers:@[oneNavigationController,
                                           twoNavigationController,
                                           threeNavigationController,
                                           fourNavigationController,
                                           fiveNavigationController]];
    
    self.window.rootViewController = tabBarController;
    
    
    //  UIDevice UIScreen AppDelegate useage
    UIDevice *currentDevice = [UIDevice currentDevice];
    NSLog(@"%@", currentDevice.systemVersion);
    
    UIScreen *currentScreen = [UIScreen mainScreen];
    NSLog(@"%@", NSStringFromCGRect(currentScreen.bounds));
    
    
    // UIApplication useage
//    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
   
}

#pragma mark - Application lifecycle methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self loadMainFrame];
    [self loadReveal];
    
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

#pragma mark - Reveal


- (void)loadReveal
{
    if (NSClassFromString(@"IBARevealLoader") == nil)
    {
        NSString *revealLibName = @"libReveal";
        NSString *revealLibExtension = @"dylib";
        NSString *error;
        NSString *dyLibPath = [[NSBundle mainBundle] pathForResource:revealLibName ofType:revealLibExtension];
        if (dyLibPath != nil)
        {
            NSLog(@"Loading dynamic library: %@", dyLibPath);
            void *revealLib = dlopen([dyLibPath cStringUsingEncoding:NSUTF8StringEncoding], RTLD_NOW);
            if (revealLib == NULL)
            {
                error = [NSString stringWithUTF8String:dlerror()];
            }
        }
        else
        {
            error = @"File not found.";
        }
        
        if (error != nil)
        {
            NSString *message = [NSString stringWithFormat:@"%@.%@ failed to load with error: %@", revealLibName, revealLibExtension, error];
            [[[UIAlertView alloc] initWithTitle:@"Reveal library could not be loaded" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }
    }
}

@end
