//
//  BLSubViewController.m
//  BLDemo03
//
//  Created by Will Ge on 7/30/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "BLSubViewController.h"

@interface BLSubViewController ()

@end

@implementation BLSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"sub view controller";
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(10, 128, self.view.bounds.size.width - 20, 44);
    [backButton setBackgroundColor:[UIColor redColor]];
    [backButton setTitle:@"back" forState:UIControlStateNormal];
    [backButton setTintColor:[UIColor blackColor]];
    [backButton addTarget:self
                   action:@selector(backButtonCliked:)
         forControlEvents:UIControlEventTouchDragInside];
    [self.view addSubview:backButton];
    
}

#pragma mark - Coustom event methods

- (void)backButtonCliked:(id)sender
{
    
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


#pragma mark - Memory maneagement

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
