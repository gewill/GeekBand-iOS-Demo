//
//  GWLoginRequestsParsers.m
//  BLDemo05 L21
//
//  Created by Will Ge on 8/21/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWLoginRequestsParsers.h"


@implementation GWLoginRequestsParsers


// 解析 JSON，转化字典或数组
- (GWUser *)parseJson:(NSData *)data {
    return nil;
}

// 解析 XML
- (GWUser *)parseXML:(NSData *)data {
    
    // 使用 NSXMLParser 进行解析 XML
    NSXMLParser *pasrser = [[NSXMLParser alloc] initWithData:data];
    NSError *error = [pasrser parserError];
    
    if (error) {
        
        NSLog(@"%@", error);
        return nil;
        
    } else {
        
        
        _currentValue = [NSMutableString string];
        _user = [[GWUser alloc] init];
        pasrser.delegate = self;
        [pasrser parse];
        
        return _user;
    }
    
    
}


#pragma mark - NSXMLParserDelegate methods

// 遇到指定元素 elementName 开始解析
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
    
    [_currentValue setString:@""];
    if ([elementName isEqualToString:@"address"]) {
        
        _address = [[GWAddress alloc] init];
    }
}

// 解析时 遇到指定元素 string，赋值给 currentValue
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    [_currentValue setString:string];
}

// 遇到指定元素 elementName 结束解析
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"userName"]) {
        _user.userName = _currentValue;
    } else if ([elementName isEqualToString:@"age"]) {
        _user.age = [_currentValue integerValue];
    } else if ([elementName isEqualToString:@"headImageUrl"]) {
        _user.headImageUrl = _currentValue;
    } else if ([elementName isEqualToString:@"address"]) {
        _user.address = _address;
        _address = nil;
    } else if ([elementName isEqualToString:@"city"]) {
        _address.city = _currentValue;
    } else if ([elementName isEqualToString:@"id"]) { // 遇到相同标签 id
        if (_address) {
            _address.cityId = _currentValue;
        } else {
            _user.userId = _currentValue;
        }
    }
}

@end
