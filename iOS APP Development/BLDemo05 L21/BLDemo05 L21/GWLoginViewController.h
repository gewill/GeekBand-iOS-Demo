//
//  GWLoginViewController.h
//  BLDemo05 L21
//
//  Created by Will Ge on 8/20/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GWLoginRequest.h"

@interface GWLoginViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)loginButtonClicked:(UIButton *)sender;

@end
