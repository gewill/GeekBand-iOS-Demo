//
//  GWLoginViewController.m
//  BLDemo05 L21
//
//  Created by Will Ge on 8/20/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWLoginViewController.h"
#import "AppDelegate.h"
#import "GWGlobal.h"

@interface GWLoginViewController () <GWLoginRequestDelegate>

@property (nonatomic, strong) GWLoginRequest *loginRequest;

@end

@implementation GWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - 点击登陆
- (IBAction)loginButtonClicked:(UIButton *)sender {
    
    self.loginRequest = [[GWLoginRequest alloc] init];
    [self.loginRequest sendLoginRequestWithUserName:_userNameTextField.text
                                           password:_passwordTextField.text
                                           delegate:self];
}

#pragma mark - GWLoginRequestDelegate methods

// 发送登陆请求成功
- (void)requestSuccess:(GWLoginRequest *)request user:(GWUser *)user {
    
    // 代理的发送者是 GWLoginViewController， 接受者是 GWLoginRequestDelegate
    // delegate 可以通过返回值的形式来给发送者作出回应。本例返回值就是 user
    // 发送登陆请求成功时，把 user 赋值给全局单例 user
    [GWGlobal shareGlobal].user = user;
    
    // 视图跳转到 UserInfo.storyboard
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate loadMainView];
    
    

}

// 发送登陆请求失败
- (void)requestFailed:(GWLoginRequest *)request error:(NSError *)error {
    
    // 弹出登陆失败警告框
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:error.description
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];

}

@end
