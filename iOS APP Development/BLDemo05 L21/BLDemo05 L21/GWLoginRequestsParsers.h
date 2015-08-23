//
//  GWLoginRequestsParsers.h
//  BLDemo05 L21
//
//  Created by Will Ge on 8/21/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWUser.h"

@interface GWLoginRequestsParsers : NSObject < NSXMLParserDelegate >

@property (nonatomic, copy) GWAddress       *address;
@property (nonatomic, copy) GWUser          *user;
@property (nonatomic, copy) NSMutableString *currentValue;

- (GWUser *)parseJson:(NSData *)data;

- (GWUser *)parseXML:(NSData *)data;

@end
