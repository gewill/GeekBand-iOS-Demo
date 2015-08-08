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
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.textLabel.text = [NSString stringWithFormat:@"Section = %li, Row = %li", indexPath.section, indexPath.row];
    
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return [NSString stringWithFormat:@"Header's title of first section "];
        case 1:
            return [NSString stringWithFormat:@"Header's title of second section "];
    
        default:
            return [NSString stringWithFormat:@"Header's title of third section "];
            break;
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
    
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
}

#pragma mark - Comforms UITableViewDelegate




#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
