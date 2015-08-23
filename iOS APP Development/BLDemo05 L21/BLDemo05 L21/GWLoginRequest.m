//
//  GWLoginRequest.m
//  BLDemo05 L21
//
//  Created by Will Ge on 8/21/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWLoginRequest.h"
#import "GWMutipartForm.h"
#import "GWLoginRequestsParsers.h"

@implementation GWLoginRequest

/**
 *  发送登陆用户名密码请求的方法
 *
 *  @param userName 用户名
 *  @param password 密码
 *  @param delegate 登陆请求的代理方法
 */
- (void)sendLoginRequestWithUserName:(NSString *)userName
                            password:(NSString *)password
                            delegate:(id<GWLoginRequestDelegate>)delegate {
    
    [self.URLConnection cancel];
    
    self.delegate = delegate;
    NSString *URLString = @"http://localhost/login.xml";
    
    // POST
    // 转化为合法的 URL 格式
    NSString *encodeURLString = [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *URL = [NSURL URLWithString:encodeURLString];
    
    // 转化为 NSMutableURLRequest ，方便调用存取方法更改属性
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = @"POST";
    request.timeoutInterval = 60;
    request.cachePolicy = NSURLRequestReloadIgnoringCacheData;
    
    // 发送的数据转换为表单
    GWMutipartForm *form = [[GWMutipartForm alloc] init];
    [form addValue:userName forField:@"username"];
    [form addValue:password forField:@"password"];
    
    request.HTTPBody = [form httpBody];
    
    // 更新 URLConnection
    self.URLConnection = [[NSURLConnection alloc] initWithRequest:request
                                                         delegate:self startImmediately:YES];
    
}

/**
 *  取消登陆请求的方法
 */
- (void)cancelRequest {
    
    if (self.URLConnection) {
        
        // 取消异步请求，并置空
        [self.URLConnection cancel];
        self.URLConnection = nil;
    }
    
}


#pragma mark - NSURLConnectionDataDelegate methods
// 作为 NSURLConnection 补充，来处理网络请求的过程

// URL 响应请求状态
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    // 转化为 NSHTTPURLResponse ，来访问 HTTP 状态码
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    
    // 根据状态码分情况处理
    if (httpResponse.statusCode == 200) { //连接成功
        
        self.receviedData = [NSMutableData data]; // 设置为一个空的 NSData
        
    } else {
        
        // 连接失败，待处理
    }
}

// 接受数据增量
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    [self.receviedData appendData:data];
}

// 完成连接或加载
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    // 整理收到的数据，并解析
    NSString *string = [[NSString alloc ] initWithData:self.receviedData
                                              encoding:NSUTF8StringEncoding];
    NSLog(@"%@", string);
    
    GWLoginRequestsParsers *parser = [[GWLoginRequestsParsers alloc] init];
    GWUser *user = [parser parseXML:self.receviedData];
    
    // 检查接收者是非实现代理方法，并响应代理方法：
    if ([_delegate respondsToSelector:@selector(requestSuccess:user:)]) {
        
        [_delegate requestSuccess:self user:user];
    }
}

// 连接失败
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    NSLog(@"%@", error);
    
    // 检查接收者是非实现代理方法，并响应代理方法：
    if ([self.delegate respondsToSelector:@selector(requestFailed:error:)]) {
        
        [self.delegate requestFailed:self error:error];
    }
}

@end
