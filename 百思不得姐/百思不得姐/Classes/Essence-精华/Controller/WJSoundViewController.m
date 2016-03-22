//
//  WJSoundViewController.m
//  百思不得姐
//
//  Created by wangju on 16/3/20.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJSoundViewController.h"

@interface WJSoundViewController ()

@end
static NSString * cellID = @"cell";
@implementation WJSoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViewController];
}

- (void)setupViewController
{
    
    self.view.backgroundColor = [UIColor clearColor];
    self.tableView.rowHeight = 60;
    
    WJLog(@"%@",NSStringFromUIEdgeInsets(self.tableView.contentInset));
    CGFloat top = CGRectGetMaxY(self.navigationController.navigationBar.frame) + WJTitleViewHeight;
    CGFloat bottom = self.tabBarController.tabBar.height;
    WJLog(@"%f",bottom);
    self.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 70;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@--%zd",NSStringFromClass([self class]),indexPath.row];
    // Configure the cell...
    
    return cell;
}

@end
