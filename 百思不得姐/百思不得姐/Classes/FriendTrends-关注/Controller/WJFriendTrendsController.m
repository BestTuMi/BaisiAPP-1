//
//  WJFriendTrendsController.m
//  百思不得姐
//
//  Created by wangju on 16/3/13.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJFriendTrendsController.h"
#import "WJRecommendController.h"
#import "WJLoginResignController.h"

@interface WJFriendTrendsController ()

@end

@implementation WJFriendTrendsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的关注";
    
    UIBarButtonItem *leftButton = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(buttonClicked)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    //设置背景色
    self.view.backgroundColor = WJGlobalBGColor;

    
}
- (IBAction)loginOrResign {
    
    WJLoginResignController *logVc = [[WJLoginResignController alloc] init];
    [self.navigationController presentViewController:logVc animated:YES completion:nil];
    
}

- (void)buttonClicked
{
    WJRecommendController *recommendVc = [[WJRecommendController alloc] init];
    [self.navigationController pushViewController:recommendVc animated:YES];
    
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
