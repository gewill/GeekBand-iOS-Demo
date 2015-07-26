//
//  ViewController.m
//  BLDemo01
//
//  Created by Will Ge on 7/26/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "ViewController.h"
#import "BLPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    BLPerson *zhangsan = [[BLPerson alloc] init];
    [zhangsan sayMyInfo];
    
    BLPerson *lisi = [[BLPerson alloc] initWithName:@"lisi" age:30];
    [lisi sayMyInfo];
    
    BLPerson *wangwu;
    wangwu = [BLPerson alloc];
    wangwu = [wangwu initWithName:@"wangwu" age:100];
    [wangwu sayMyInfo];
    
    [BLPerson printMessage:@"GEEKBOOD"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
