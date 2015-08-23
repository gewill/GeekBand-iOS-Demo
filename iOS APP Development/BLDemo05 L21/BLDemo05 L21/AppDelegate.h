//
//  AppDelegate.h
//  BLDemo05 L21
//
//  Created by Will Ge on 8/20/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

// 声明一个 UINavigationController 属性，作为 rootViewController
@property (strong, nonatomic) UINavigationController *loginNavigationVC;

/**
 *  使用代码加载 Login.storyboard 的函数
 */
- (void)loadLoginView;

/**
 *  使用代码加载 Login.storyboard 的函数
 */
- (void)loadMainView;
@end

