//
//  WJEssenceController.m
//  百思不得姐
//
//  Created by wangju on 16/3/13.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJEssenceController.h"
#import "WJRecommandTagController.h"

@interface WJEssenceController ()

@end

@implementation WJEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
//    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor yellowColor];
//    view.width = 200;
//    view.heigth = 40;
//    self.navigationItem.titleView = view;

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(buttonClicked)];
    
    //设置背景色
    self.view.backgroundColor = WJGlobalBGColor;
    
  
}

- (void)buttonClicked
{
    WJRecommandTagController *tagVc= [[WJRecommandTagController alloc] init];
    [self.navigationController pushViewController:tagVc animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
