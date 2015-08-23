//
//  GWUserInfoViewController.m
//  BLDemo05 L21
//
//  Created by Will Ge on 8/20/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWUserInfoViewController.h"
#import "GWGlobal.h"
#import "GWImageDownloader.h"

@interface GWUserInfoViewController () <GWImageDownloaderDelegate>

@property (strong, nonatomic) GWImageDownloader *downloader;
@property (nonatomic        ) BOOL              isDownloading;

@end

@implementation GWUserInfoViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"用户信息";
    self.constraint.constant = 44;
    self.userInfoLabel.text = [GWGlobal shareGlobal].user.userName;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - 点击下载按钮

- (IBAction)downloadButtonClicked:(UIButton *)sender {
    
    // 开启 activity View
    _isDownloading = YES;
    _progressView.progress = 0;
    _headImageView.image = nil;
    [_activityView startAnimating];
    
    // 初始化 GWImageDownloader，并开始下载方法 download: delegate:
    _downloader = [[GWImageDownloader alloc] init];
    _downloader.delegate = self;
    
    // 添加一个测试用户，并设置头像
//    GWUser *testUser = [GWUser initWithHeadImageUrl:@"http://www.fashiongonerogue.com/wp-content/uploads/2014/07/karlie-kloss-nike-workout-photos6.jpg"];
    
    [_downloader download:[GWGlobal shareGlobal].user.headImageUrl delegate:self];

    
}

#pragma mark - 实现 GWImageDownloaderDelegate 代理方法

// 下载中的代理方法
- (void)downloadReceivedData:(GWImageDownloader *)downloader
{
    _progressView.progress
    = [downloader.receivedData length] / (double)downloader.totalLength;
}

// 下载成功的代理方法
- (void)downloadSuccess:(GWImageDownloader *)downloader data:(NSData *)data
{
    [_activityView stopAnimating];
    _isDownloading = NO;
    _headImageView.image = [[UIImage alloc] initWithData:data];
}

// 下载失败的代理方法
- (void)downloadFailed:(GWImageDownloader *)downloader error:(NSError *)error
{
    [_activityView stopAnimating];
    _isDownloading = NO;
}

@end
