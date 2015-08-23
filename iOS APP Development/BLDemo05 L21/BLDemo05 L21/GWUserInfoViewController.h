//
//  GWUserInfoViewController.h
//  BLDemo05 L21
//
//  Created by Will Ge on 8/20/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GWUserInfoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIButton *downloadButton;
@property (weak, nonatomic) IBOutlet UILabel *userInfoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraint;

- (IBAction)downloadButtonClicked:(id)sender;

@end
