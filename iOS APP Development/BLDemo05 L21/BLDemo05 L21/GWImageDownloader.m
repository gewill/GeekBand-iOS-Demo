//
//  GWImageDownloader.m
//  BLDemo05 L21
//
//  Created by Will Ge on 8/21/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWImageDownloader.h"

@interface GWImageDownloader()  <NSURLConnectionDataDelegate>

@end


@implementation GWImageDownloader


/**
 *  下载图片方法
 *
 *  @param URLString 图片的 URL 地址
 *  @param delegate  使用的协议
 */
- (void)download:(NSString *)URLString
        delegate:(id <GWImageDownloaderDelegate>)delegate {
    
    [self cancel];
    
    // GET
    self.delegate = delegate;
    
    NSString *encodedURLString = [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *URL = [NSURL URLWithString:encodedURLString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    
    self.URLConnection = [[NSURLConnection alloc] initWithRequest:request
                                                         delegate:self
                                                 startImmediately:YES];
    
}

/**
 *  取消下载的方法
 */
- (void)cancel {
    
    if (self.URLConnection) {
        [self.URLConnection cancel];
    }
    
    self.URLConnection = nil;
    
}


#pragma mark - NSURLConnectionDataDelegate methods 整个网络请求的数据的过程

// URL 响应请求状态
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse *)response;
    
    if (httpURLResponse.statusCode == 200) {
        
        // 获取资源长度，方便后面显示下载进度
        self.totalLength = httpURLResponse.expectedContentLength;
        
        self.receivedData = [NSMutableData data];
    }
}

// 接受数据增量
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    [self.receivedData appendData: data];
    if ([_delegate respondsToSelector:@selector(downloadReceivedData:)]) {
        [_delegate downloadReceivedData:self];
    }
}

// 完成连接或加载
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    if ([_delegate respondsToSelector:@selector(downloadSuccess:data:)]) {
        [_delegate downloadSuccess:self data:self.receivedData];
    }
}

// 连接失败
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    if ([_delegate respondsToSelector:@selector(downloadFailed:error:)]) {
        [_delegate downloadFailed:self error:error];
    }
}


@end
