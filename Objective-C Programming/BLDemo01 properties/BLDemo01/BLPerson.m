//
//  BLPerson.m
//  BLDemo01
//
//  Created by Will Ge on 7/26/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "BLPerson.h"

@implementation BLPerson


// 添加 copy 
- (void)setName:(NSString *)name
{
    _name = [name copy];
}
- (void)setAge:(NSInteger)age { _age = age; }
- (NSString *)name { return _name; }
- (NSInteger)age { return _age; }

- (id)initWithName:(NSString *)name age:(NSInteger)age
{
    self = [super init];
    
    if (self) {
        _name = [name copy];
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

