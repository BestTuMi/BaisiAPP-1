//
//  WJAllViewController.m
//  百思不得姐
//
//  Created by wangju on 16/3/20.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJAllViewController.h"

@interface WJAllViewController ()

@end

static NSString * cellID = @"cell";

@implementation WJAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.automaticallyAdjustsScrollViewInsets = NO;

    self.tableView.y = 0;
    WJLog(@"%@",NSStringFromCGRect(self.view.frame));
    self.view.backgroundColor = [UIColor redColor];
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
