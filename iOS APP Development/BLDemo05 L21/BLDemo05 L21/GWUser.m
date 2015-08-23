//
//  GWUser.m
//  BLDemo05 L21
//
//  Created by Will Ge on 8/21/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWUser.h"

@implementation GWUser


+ (GWUser *)initWithHeadImageUrl:(NSString *) headIamgeUrl {
    
    GWUser *user = [[GWUser alloc] init];
    user.headImageUrl = headIamgeUrl;
    return user;
}
@end
