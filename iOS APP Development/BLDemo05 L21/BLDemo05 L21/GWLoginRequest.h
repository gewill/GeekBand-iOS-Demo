//
//  GWLoginRequest.h
//  BLDemo05 L21
//
//  Created by Will Ge on 8/21/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GWUser.h"

#pragma mark - 添加代理协议，通知是否登陆成功，用户是谁？

@class GWLoginRequest;

@protocol GWLoginRequestDelegate <NSObject>

/**
 *  发送登陆请求成功
 *
 *  @param request 登陆请求
 *  @param user     登陆用户名
 */
- (void)requestSuccess:(GWLoginRequest *)request user:(GWUser *)user;

/**
 *  发送登陆请求失败
 *
 *  @param request 登陆请求
 *  @param error   错误信息
 */
- (void)requestFailed:(GWLoginRequest *)request error:(NSError *)error;

@end

#pragma mark - 发送登陆请求的类

@interface GWLoginRequest : NSObject <NSURLConnectionDataDelegate>


@property (nonatomic, strong) NSURLConnection             *URLConnection;
@property (nonatomic, strong) NSMutableData               *receviedData;
@property (nonatomic, weak  ) id <GWLoginRequestDelegate> delegate;


/**
 *  发送登陆用户名密码请求的方法
 *
 *  @param userName 用户名
 *  @param password 密码
 *  @param delegate 登陆请求的代理方法
 */
- (void)sendLoginRequestWithUserName:(NSString *)userName
                            password:(NSString *)password
                            delegate:(id<GWLoginRequestDelegate>)delegate;

/**
 *  取消登陆请求的方法
 */
- (void)cancelRequest;

@end
