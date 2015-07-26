//
//  BLPerson.m
//  BLDemo01
//
//  Created by Will Ge on 7/26/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "BLPerson.h"

@implementation BLPerson

- (id)initWithName:(NSString *)name age:(NSInteger)age
{
    self = [super init];
    
    if (self) {
        _name = name;
        _age = age;
    }
    
    return self;
}

- (void)sayMyInfo
{
    NSLog(@"我叫%@，今年%li岁。", _name, _age);
}

+ (void)printMessage:(NSString *)message
{
    NSLog(@"已打印出：%@", message);
}

@end

