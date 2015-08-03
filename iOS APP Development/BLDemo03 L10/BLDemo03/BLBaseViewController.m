//
//  BLBaseViewController.m
//  BLDemo03
//
//  Created by Will Ge on 7/29/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "BLBaseViewController.h"

@interface BLBaseViewController ()

@end

@implementation BLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.bgImageView.backgroundColor = [UIColor clearColor];
    self.bgImageView.image = [UIImage imageNamed:@"bgbase"];
    [self.view addSubview:self.bgImageView];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
