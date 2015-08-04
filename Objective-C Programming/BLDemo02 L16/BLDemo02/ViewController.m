//
//  ViewController.m
//  BLDemo02
//
//  Created by Will Ge on 8/3/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "ViewController.h"
#import "BLDragonView.h"
#import "NSString+URL.h"
#import "BLDragonView+Hide.h"

@interface ViewController ()
{
    BLDragonView *_dragonView1;
}

@property(nonatomic, retain)BLDragonView *dragonView;

@end

@implementation ViewController


#pragma mark - add a NSNotification to NSNotificationCenter

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]  removeObserver:self];
}


- (void)receivedDragonViewNotification:(NSNotification *)notification {
    NSLog(@"time is %@", [notification.userInfo valueForKey:@"time"]);
}



#pragma mark  - viewDidLoad

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // test category: NSString+URL
    NSString *url = @"http://www.google.com";
    if ([url isURL]) {
        NSLog(@"url is an URL.");
    } else {
        NSLog(@"url isn't an URL.");
    }
    
    // get Screen width and height
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    // add two dragons to our Screen
    _dragonView = [[BLDragonView alloc] initWithFrame:CGRectMake(0, 0, width, 180)];
    _dragonView.delegate = self;
    _dragonView.tag = 200;
    [self.view addSubview:_dragonView];
    
    _dragonView1 = [[BLDragonView alloc] initWithFrame:CGRectMake(0, 350, width, 180)];
    _dragonView1.delegate = self;
    _dragonView1.tag = 100;
    _dragonView1.backgroundColor = [UIColor colorWithRed:0.462 green:0.8383 blue:1.0 alpha:1.0];
    [self.view addSubview:_dragonView1];
    
    // add a hideButton
    UIButton *hideButton = [UIButton buttonWithType:UIButtonTypeCustom];
    hideButton.frame = CGRectMake((width - 50) / 2, (height - 60) / 2, 50, 50);
    [hideButton setImage:[UIImage imageNamed:@"hide.png"] forState:(UIControlStateNormal)];
    [hideButton addTarget:self action:@selector(hideButtonCliked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hideButton];
    
    // add a Status Label
    _dragonStatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, height - 60, width, 60)];
    _dragonStatusLabel.backgroundColor = [UIColor colorWithRed:0.5705 green:0.5705 blue:0.5705 alpha:1.0];
    _dragonStatusLabel.numberOfLines = 0;
    _dragonStatusLabel.font = [UIFont systemFontOfSize:18];
    _dragonStatusLabel.text = @"dragon's status";
    _dragonStatusLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_dragonStatusLabel];
    
}


#pragma mark - Conform BLDragonViewDelegate methods

- (void)backButtonClicked:(BLDragonView *)dragonView {
    
}

- (void)forwardButtonClicked:(BLDragonView *)dragonView {
    if (dragonView.tag == 100) {
        _dragonStatusLabel.text = [NSString stringWithFormat:@"Forward"];
    } else if (dragonView.tag == 200) {
        CGFloat X = dragonView.dragonImageView.frame.origin.x;
        CGFloat Y = dragonView.dragonImageView.frame.origin.y;
        _dragonStatusLabel.text = [NSString stringWithFormat:@"Forward: (x, y) = (%f, %f)", X, Y];
    }
}



#pragma mark - hideButtonCliked: method

// test category: BLDragonView+Hide 
- (void)hideButtonCliked:(id)sender {
    [_dragonView hideOrShow];
}


#pragma mark - didReceiveMemoryWarning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
