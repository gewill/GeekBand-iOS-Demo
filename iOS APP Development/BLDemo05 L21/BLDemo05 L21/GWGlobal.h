//
//  GWGlobal.h
//  BLDemo05 L21
//
//  Created by Will Ge on 8/21/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWUser.h"

/**
 *  设置一个全局变量以共享信息，单例模式
 */
@interface GWGlobal : NSObject

@property (strong, nonatomic) GWUser *user;

+ (GWGlobal *)shareGlobal;

@end
