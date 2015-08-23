//
//  GWUser.h
//  BLDemo05 L21
//
//  Created by Will Ge on 8/21/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWAddress.h"

@interface GWUser : NSObject

@property (copy, nonatomic  ) NSString  *userId;
@property (copy, nonatomic  ) NSString  *userName;
@property (nonatomic        ) NSInteger age;
@property (copy, nonatomic  ) NSString  *headImageUrl;
@property (strong, nonatomic) GWAddress *address;

+ (GWUser *)initWithHeadImageUrl:(NSString *) headIamgeUrl;

@end
