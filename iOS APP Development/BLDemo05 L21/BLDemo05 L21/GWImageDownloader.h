//
//  GWImageDownloader.h
//  BLDemo05 L21
//
//  Created by Will Ge on 8/21/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol GWImageDownloaderDelegate;

@interface GWImageDownloader : NSObject

@property (nonatomic, strong) NSURLConnection                 *URLConnection;
@property (nonatomic, strong) NSMutableData                   *receivedData;
@property (nonatomic        ) long long                       totalLength;
@property (nonatomic, weak  ) id < GWImageDownloaderDelegate> delegate;

/**
 *  下载图片方法
 *
 *  @param URLString 图片的 URL 地址
 *  @param delegate  使用的协议
 */
- (void)download:(NSString *)URLString
        delegate:(id <GWImageDownloaderDelegate>)delegate;

/**
 *  取消下载的方法
 */
- (void)cancel;

@end



// 声明一个图片下载对应的协议
@protocol GWImageDownloaderDelegate  <NSObject>

/**
 *  下载成功的代理方法
 *
 *  @param downloader <#downloader description#>
 *  @param data       <#data description#>
 */
- (void)downloadSuccess:(GWImageDownloader *)downloader data:(NSData *)data;

/**
 *  下载失败的代理方法
 *
 *  @param downloader <#downloader description#>
 *  @param error      <#error description#>
 */
- (void)downloadFailed:(GWImageDownloader *)downloader error:(NSError *)error;

/**
 *  下载中代理方法
 *
 *  @param downloader <#downloader description#>
 */
- (void)downloadReceivedData:(GWImageDownloader *)downloader;

@end