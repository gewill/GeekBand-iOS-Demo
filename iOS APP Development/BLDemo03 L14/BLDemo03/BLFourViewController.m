//
//  BLFourViewController.m
//  BLDemo03
//
//  Created by Will Ge on 7/29/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "BLFourViewController.h"

@interface BLFourViewController ()

@end

@implementation BLFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // set title and background image
    self.title = @"four";
    self.bgImageView.image = [UIImage imageNamed:@"bg4"];
    
    // get webView's width and height
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height -20 - 44 -44 -44;
    
    // add an UIWebView
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    _webView.delegate = self;
    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
    
    _webView.backgroundColor = [UIColor colorWithRed:1.0 green:0.1643 blue:0.2517 alpha:0.0];

    
    // add a NSURL
    NSString *URLString = @"http://bing.com";
    NSURL *URL = [NSURL URLWithString:URLString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:URL];
    [_webView loadRequest:urlRequest];
    
    
    // add an UIActivityIndicatorView
    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleWhite)];
    _activityView.frame = CGRectMake(30, 30, 30, 30);
    _activityView.color = [UIColor colorWithRed:1.0 green:0.1514 blue:0.1263 alpha:1.0];
    [_activityView hidesWhenStopped];
    [self.view addSubview:_activityView];
    
    
    // add an UIToolBar（拖把）
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, _webView.frame.origin.y + height, width, 44)];
    toolBar.backgroundColor = [UIColor colorWithRed:1.0 green:0.1518 blue:0.0 alpha:0.38];
    [self.view addSubview:toolBar];
    
    UIBarButtonItem *rewind = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind
                                                                            target:self
                                                                            action:@selector(clickedRewind:)];
    UIBarButtonItem *fastForward = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward
                                                                            target:self
                                                                            action:@selector(clickedFastForward:)];
    
    
    UIBarButtonItem *refresh = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                             target:self
                                                                             action:@selector(clickedRefresh:)];
    
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                target:nil
                                                                                action:nil];
    fixedSpace.width = 40;
    
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                   target:nil
                                                                                   action:nil];
    
    [toolBar setItems:[NSArray arrayWithObjects:rewind, fixedSpace, fastForward, flexibleSpace, refresh, nil]];
    
}



#pragma mark - Custom UIWebViewDelegate methods

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    //    // a good try to disbale a url to do something instead
    //    NSString *url = [request.URL absoluteString];
    //    if ([url isEqualToString:@"bl://photo"]) {
    //        return NO;
    //    }
    return YES;
}


- (void)webViewDidStartLoad:(UIWebView *)webView {
    [_activityView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [_activityView stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [_webView reload];
}


#pragma mark - Custom UIToolBar event methods


- (void)clickedRewind:(UIBarButtonItem *)button {
    if ([_webView canGoBack]) {
        [_webView goBack];
    }
}

- (void)clickedFastForward:(UIBarButtonItem *)button {
    if ([_webView canGoForward]) {
        [_webView goForward];
    }
}

- (void)clickedRefresh:(UIBarButtonItem *)button {
    [_webView reload];
}


#pragma mark - Memory management


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
