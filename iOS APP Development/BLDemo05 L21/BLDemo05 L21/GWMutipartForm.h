//
//  GWMutipartForm.h
//  BLDemo05 L21
//
//  Created by Will Ge on 8/21/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 一般情况下，协议文档（API）规定的以POST方式请求服务器的时候，向服务器发送的数据一般以表单的形式作为HTTP的Body提交。本类封装了如果将要发送的数据转换为表单。
 */

@interface GWMutipartForm : NSObject {
    NSMutableArray	*_fields;
    NSString		*_boundaryString;
}

- (void)addValue:(id)value forField:(NSString *)field;
- (NSData *)httpBody;
- (NSString *)boundary;
- (NSString *)contentType;

- (NSString *)getRandomBoundary;

@end
