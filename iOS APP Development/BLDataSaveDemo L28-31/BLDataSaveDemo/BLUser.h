//
//  BLUser.h
//  BLDataSaveDemo
//
//  Created by duansong on 11-5-21.
//  Copyright 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLPoem.h"

// NSData 必须遵循 NSCoding 的协议
@interface BLUser : NSObject < NSCoding >

@property (nonatomic, retain) NSString	*userName;
@property (nonatomic, retain) NSString  *email;
@property (nonatomic, retain) NSString	*password;
@property (nonatomic, assign) NSInteger age;

@end
