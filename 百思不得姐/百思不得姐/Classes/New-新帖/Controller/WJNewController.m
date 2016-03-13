//
//  WJNewController.m
//  百思不得姐
//
//  Created by wangju on 16/3/13.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJNewController.h"

@interface WJNewController ()

@end

@implementation WJNewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%s",__func__);
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(buttonClicked)];
    
    //设置背景色
    self.view.backgroundColor = WJGlobalBGColor;
    
}

- (void)buttonClicked
{
    WJLogFunc;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
