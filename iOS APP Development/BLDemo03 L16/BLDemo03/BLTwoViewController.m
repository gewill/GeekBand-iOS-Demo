//
//  BLTwoViewController.m
//  BLDemo03
//
//  Created by Will Ge on 7/29/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "BLTwoViewController.h"

@interface BLTwoViewController ()

@end

@implementation BLTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"two";
    self.bgImageView.image = [UIImage imageNamed:@"bg2"];
    
    
    // add an UITextField
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 300, 20)];
    textField.backgroundColor = [UIColor colorWithRed: 0.9626 green: 0.9956 blue: 0.9284 alpha: 1.0];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.adjustsFontSizeToFitWidth = YES;
    textField.textAlignment = NSTextAlignmentLeft;
    textField.textColor = [UIColor blackColor];
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.secureTextEntry = NO;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.placeholder = @"Enter your email here.";
    textField.text = @"Sketch 进阶与技巧";
    textField.contentVerticalAlignment = UIControlContentHorizontalAlignmentLeft;
    textField.delegate = self;
    [self.view addSubview:textField];
    
    // add an UITextView
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 40, 300, 300)];
    textView.backgroundColor = [UIColor colorWithRed: 0.7437 green: 0.9786 blue: 0.7509 alpha: 1.0];
    textView.textAlignment = NSTextAlignmentLeft;
    textView.textColor = [UIColor blackColor];
    textView.returnKeyType = UIReturnKeyDone;
    textView.secureTextEntry = NO;
    textView.keyboardType = UIKeyboardTypeDefault;
    textView.delegate = self;
    textView.text = @"Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧Sketch 进阶与技巧";
    [self.view addSubview:textView];
    
}

#pragma amrk - UITextFieldDelegate methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if (textField.text.length >= 20) {
        return NO;
    } else {
        
        return YES;
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"textFieldDidBeginEditing");
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return NO;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"textFieldDidEndEditing");
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (1 < 0) {
        return YES;
    } else {
        return NO;
    }
    
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"%@", textField.text);
    [textField resignFirstResponder];
    return YES;
}

#pragma amrk - UITextViewDelegate methods

- (void)textViewDidChangeSelection:(UITextView *)textView {
    NSLog(@"%@", textView);
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}


#pragma mark - Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
