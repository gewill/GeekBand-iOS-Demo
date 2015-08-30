//
//  BLUser.m
//  BLDataSaveDemo
//
//  Created by duansong on 11-5-21.
//  Copyright 2015 __MyCompanyName__. All rights reserved.
//

#import "BLUser.h"


@implementation BLUser

@synthesize userName	= _userName;
@synthesize email		= _email;
@synthesize password	= _password;
@synthesize age			= _age;

#pragma mark -
#pragma mark NSCoding delegate methods

/**
 *  解码
 *
 *  @param aDecoder 编码类型
 *
 *  @return 解码得到的对象
 */
- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super init];
	if (self) {
		self.userName	= [aDecoder decodeObjectForKey:@"userName"];
		self.email		= [aDecoder decodeObjectForKey:@"email"];
		self.password	= [aDecoder decodeObjectForKey:@"password"];
		self.age		= [aDecoder decodeIntForKey:@"age"];
	}
	return self;
}

/**
 *  编码
 *
 *  @param aCoder 编码类型
 */
- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:_userName forKey:@"userName"];
	[aCoder encodeObject:_email forKey:@"email"];
	[aCoder encodeObject:_password forKey:@"password"];
	[aCoder encodeInteger:_age forKey:@"age"];
}


#pragma mark -
#pragma mark memory management methods

- (void) dealloc {
	self.userName		= nil;
	self.email			= nil;
	self.password		= nil;
}

@end
