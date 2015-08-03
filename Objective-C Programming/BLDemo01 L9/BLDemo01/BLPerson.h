//
//  BLPerson.h
//  BLDemo01
//
//  Created by Will Ge on 7/26/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLPerson : NSObject
{
    NSString *_name;
    NSInteger _age;
}

- (id)initWithName:(NSString *)name age:(NSInteger)age;

- (void)sayMyInfo;

+ (void)printMessage:(NSString *)message;

- (void)setName:(NSString *)name;
- (void)setAge:(NSInteger)age;
- (NSString *)name;
- (NSInteger)age;

@end
