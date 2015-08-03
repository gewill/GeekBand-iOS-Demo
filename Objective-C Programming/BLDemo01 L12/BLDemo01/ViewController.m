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

- (void)dealloc
{
     
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    BLPerson *tempPerson = [BLPerson createPerson];
    [tempPerson sayMyInfo];
    
    BLPerson *zhangsan = [[BLPerson alloc] init];
    [zhangsan sayMyInfo];
    
    BLPerson *lisi = [[BLPerson alloc] initWithName:@"lisi" age:30];
    [lisi sayMyInfo];
    [lisi setName:@"李斯"];
    [lisi setAge:22]; 
    [lisi sayMyInfo];
    
    NSString *lisiName = [lisi name];
    NSInteger lisiAge = [lisi age];
    NSLog(@"lisiName = %@, lisiAge = %li", lisiName, lisiAge);
    
    [lisi retain];
    [lisi release];
    [lisi release];
    
    BLPerson *wangwu;
    wangwu = [BLPerson alloc];
    wangwu = [wangwu initWithName:@"wangwu" age:100];
    wangwu.name = @"王五第三";
    wangwu.age = 101;
    [wangwu sayMyInfo];
    
    
    NSMutableString *personName = [NSMutableString stringWithFormat:@"王五"];
    [wangwu setName:personName];
    [personName appendFormat:@"第二"];
    NSLog(@"personName = %@, wangwu's name = %@", personName, [wangwu name]);
    
    
    [BLPerson printMessage:@"GeekBand"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
