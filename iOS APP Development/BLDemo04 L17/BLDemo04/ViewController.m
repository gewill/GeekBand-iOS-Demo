//
//  ViewController.m
//  BLDemo04
//
//  Created by Will Ge on 8/5/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.3897 green:0.921 blue:0.1981 alpha:1.0];
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height)
                                              style:(UITableViewStyleGrouped)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.separatorColor = [UIColor colorWithRed:0.0 green:0.502 blue:0.251 alpha:1.0];
    
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 100)];
    headerView.backgroundColor = [UIColor colorWithRed:0.3698 green:0.8993 blue:0.7738 alpha:0.74];
    _tableView.tableHeaderView = headerView;
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 100)];
    footerView.backgroundColor = [UIColor colorWithRed:0.3546 green:0.7429 blue:0.8772 alpha:0.74];
    _tableView.tableFooterView = footerView;
}


#pragma mark - Comforms UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 3;
            
        default:
            return 200;
            break;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault)
                                      reuseIdentifier:cellIndentifier];
    }
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    cell.textLabel.text = [NSString stringWithFormat:@"Section = %li, Row = %li", indexPath.section, indexPath.row];
    
    return cell;
}


#pragma mark - Comforms UITableViewDelegate



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    headerView.backgroundColor = [UIColor colorWithRed:0.8878 green:0.1574 blue:0.0867 alpha:0.74];
    
    return headerView;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    footerView.backgroundColor = [UIColor colorWithRed:0.0 green:0.502 blue:0.502 alpha:1.0];
    
    return footerView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:[NSString stringWithFormat:@"section = %li, row = %li", indexPath.section, indexPath.row]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}


#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
