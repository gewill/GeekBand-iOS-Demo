//
//  BLOneViewController.m
//  BLDemo03
//
//  Created by Will Ge on 7/29/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "BLOneViewController.h"
#import "BLSubViewController.h"

#define kOneAlertViewTag  100
#define kPushButtonTag    101
#define kPresentButtonTag 102

@interface BLOneViewController () <UIAlertViewDelegate, UIActionSheetDelegate>

@end

@implementation BLOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"one";
    self.bgImageView.image = [UIImage imageNamed:@"bg1"];
    
    
    //  add "push a view" button
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pushButton.tag = kPushButtonTag;
    pushButton.frame = CGRectMake(10, 74, self.view.bounds.size.width - 20, 44);
    [pushButton setBackgroundColor:[UIColor clearColor]];
    UIImage *blueBGImage = [UIImage imageNamed:@"blueButton.png"];
    UIImage *stretchableBlueBGImage = [blueBGImage stretchableImageWithLeftCapWidth:10 topCapHeight:20];
    [pushButton setBackgroundImage:stretchableBlueBGImage
                          forState:UIControlStateNormal];
    [pushButton setTitle:@"push a view" forState:UIControlStateNormal];
    [pushButton setTintColor:[UIColor blackColor]];
    [pushButton addTarget:self
                   action:@selector(buttonCliked:)
         forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:pushButton];
    
    
    //  add "present a modal view" button
    UIButton *presentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    presentButton.tag = kPresentButtonTag;
    presentButton.frame = CGRectMake(10, 128, self.view.bounds.size.width - 20, 44);
    [presentButton setBackgroundColor:[UIColor clearColor]];
    UIImage *whiteBGImage = [UIImage imageNamed:@"whiteButton.png"];
    UIImage *stretchableWhiteBGImage = [whiteBGImage stretchableImageWithLeftCapWidth:10 topCapHeight:20];
    [presentButton setBackgroundImage:stretchableWhiteBGImage forState:UIControlStateNormal];
    [presentButton setTitle:@"present a modal view" forState:UIControlStateNormal];
    [presentButton setTintColor:[UIColor colorWithRed:30 / 255.0f green:90 /255.0f blue:19 /255.0f alpha:1]];
    [presentButton addTarget:self
                   action:@selector(buttonCliked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentButton];
    
    // add an "alert" UIBarButton
    UIBarButtonItem *alert = [[UIBarButtonItem alloc]   initWithTitle:@"alert"
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(alertButtonCliked:)];
    
    self.navigationItem.leftBarButtonItem = alert;
    
    // add an UIImageView and an image in it
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 138, 200, 200)];
    imageView.image = [UIImage imageNamed:@"bg5.png"];
    imageView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imageView];
    
    
    // add a label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, imageView.frame.origin.y + imageView.frame.size.height + 10, self.view.frame.size.width - 20, 20)];
    label.backgroundColor = [UIColor whiteColor];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:16.0f];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    
    label.text = @"小时不识月，呼作白玉盘。又疑瑶台镜，飞在青云端。仙人垂两足，桂树何团团。白兔捣药成，问言与谁餐？";
    CGSize textSize = [label.text boundingRectWithSize:CGSizeMake(label.frame.size.width - 25, CGFLOAT_MAX)
                                               options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                            attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16],} context:nil].size;
    label.frame = CGRectMake(10, label.frame.origin.y, textSize.width, textSize.height);
    
    [self.view addSubview:label];

}

#pragma mark - Coustom event methods

- (void)buttonCliked:(UIButton *)sender
{
    if (sender.tag == kPushButtonTag) {
        BLSubViewController *subViewController = [[BLSubViewController alloc] init];
        [self.navigationController pushViewController:subViewController animated:YES];
 
    } else if (sender.tag == kPresentButtonTag) {
        
        BLSubViewController *subViewController = [[BLSubViewController alloc] init];
        [self presentViewController:subViewController
                           animated:YES
                         completion:nil];
    }
    
}

#pragma mark - Coustom "alert" Alert context

- (void)alertButtonCliked:(UIBarButtonItem *)button {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title"
                                                    message:@"This is the alert body. \n\n\n\n\n\\n\n\n"
                                                   delegate:self
                                          cancelButtonTitle:@"cancel"
                                          otherButtonTitles:@"one", @"two", @"three", nil];
    alert.tag = kOneAlertViewTag;
    [alert show];
}

#pragma mark - UIAlertViewDelegate methods

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == kOneAlertViewTag) {
        if (buttonIndex == 2) {
            UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"UIActionSheet"
                                                                     delegate:self
                                                            cancelButtonTitle:@"Cancel"
                                                       destructiveButtonTitle:@"No1"
                                                            otherButtonTitles:@"No2", @"No3", nil];
            [actionSheet showInView:self.view.window];
        }
    }
    
    
    
}


- (void)alertView:(UIAlertView *)alertView
didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
}

#pragma mark - UIActionSheetDelegate methods

- (void)actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex {
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet
didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
}


#pragma mark - Memory maneagement

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
