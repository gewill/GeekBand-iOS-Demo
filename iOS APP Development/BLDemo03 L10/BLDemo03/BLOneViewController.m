//
//  BLOneViewController.m
//  BLDemo03
//
//  Created by Will Ge on 7/29/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "BLOneViewController.h"


@interface BLOneViewController ()

@end

@implementation BLOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"one";
    
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pushButton.frame = CGRectMake(10, 74, self.view.bounds.size.width - 20, 44);
    [pushButton setBackgroundColor:[UIColor cyanColor]];
    [pushButton setTitle:@"push a view" forState:UIControlStateNormal];
    [pushButton setTintColor:[UIColor blackColor]];
    [pushButton addTarget:self
                   action:@selector(pushButtonCliked:)
         forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:pushButton];
    
    UIButton *presentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    presentButton.frame = CGRectMake(10, 128, self.view.bounds.size.width - 20, 44);
    [presentButton setBackgroundColor:[UIColor blueColor]];
    [presentButton setTitle:@"present a modal view" forState:UIControlStateNormal];
    [presentButton setTintColor:[UIColor blackColor]];
    [presentButton addTarget:self
                   action:@selector(presentButtonCliked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentButton];
    
    
}

#pragma mark - Coustom event methods

- (void)pushButtonCliked:(id)sender
{
    BLSubViewController *subViewController = [[BLSubViewController alloc] init];
    [self.navigationController pushViewController:subViewController animated:YES];
}

- (void)presentButtonCliked:(id)sender
{
    BLSubViewController *subViewController = [[BLSubViewController alloc] init];
    [self presentViewController:subViewController
                       animated:YES
                     completion:nil];
}


#pragma mark - Memory maneagement

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
