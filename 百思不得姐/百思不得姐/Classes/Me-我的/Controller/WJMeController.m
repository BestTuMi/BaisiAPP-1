//
//  WJMeController.m
//  百思不得姐
//
//  Created by wangju on 16/3/13.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJMeController.h"

@interface WJMeController ()

@end

@implementation WJMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的";
    
    UIBarButtonItem *settingBtn = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingBtnClicked)];
    UIBarButtonItem *moonBtn = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonBtnClicked)];
    self.navigationItem.rightBarButtonItems = @[settingBtn,moonBtn];
    
    //设置背景色
    self.view.backgroundColor = WJGlobalBGColor;
    
}

- (void)settingBtnClicked
{
    WJLogFunc;

}

- (void)moonBtnClicked
{
    WJLogFunc;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
