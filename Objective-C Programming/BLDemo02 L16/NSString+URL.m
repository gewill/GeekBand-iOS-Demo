//
//  NSString+URL.m
//  BLDemo02
//
//  Created by Will Ge on 8/4/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "NSString+URL.h"

@implementation NSString (URL)

- (bool)isURL {
    if ([self hasPrefix:@"http://"]) {
        return YES;
    } else {
        return NO;
    }
}

@end
