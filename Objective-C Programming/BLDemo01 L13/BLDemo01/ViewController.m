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
    
    NSNumber *int1 = [NSNumber numberWithInt:1];
    
    NSArray *array = [[NSArray alloc] initWithObjects:tempPerson, int1, tempPerson, nil];
    
    NSLog(@"array count = %li", [array count]);
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    [mutableArray addObject:tempPerson];
    [mutableArray addObject:int1];
    [mutableArray removeObjectAtIndex:0];
    [mutableArray replaceObjectAtIndex:0 withObject:tempPerson];
    
    id object = [mutableArray objectAtIndex:0];
    if ([[object class] isSubclassOfClass:[NSNumber class]]) {
        NSInteger intValue = [(NSNumber *)object integerValue];
        NSLog(@"intValue = %li", intValue);
    }else if ([[object class] isSubclassOfClass:[BLPerson class]]) {
        [(BLPerson *)object sayMyInfo];
    }
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:tempPerson, @"person", int1, @"int", nil];
    NSArray *allKeys = [dictionary allKeys];
    for (int i = 0; i < [allKeys count]; i++) {
        NSString *key = allKeys[i];
        id object = [dictionary valueForKey:key];
        if ([[object class] isSubclassOfClass:[NSNumber class]]) {
            NSInteger intValue = [(NSNumber *)object integerValue];
            NSLog(@"intValue = %li", intValue);
        }else if ([[object class] isSubclassOfClass:[BLPerson class]]) {
            [(BLPerson *)object sayMyInfo];
        }
    }
    
    for (NSString *key in allKeys) {
        id object = [dictionary valueForKey:key];
        if ([[object class] isSubclassOfClass:[NSNumber class]]) {
            NSInteger intValue = [(NSNumber *)object integerValue];
            NSLog(@"intValue = %li", intValue);
        }else if ([[object class] isSubclassOfClass:[BLPerson class]]) {
            [(BLPerson *)object sayMyInfo];
        }
    }
    
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] init];
    [mutableDic setValue:tempPerson forKey:@"person"];
    [mutableDic setValue:int1 forKey:@"int"];
    
    [mutableDic removeObjectForKey:@"person"];
    
    [mutableDic setValue:[NSNumber numberWithDouble:3.14] forKey:@"int"];


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
