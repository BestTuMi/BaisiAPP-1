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


/*标题栏底部的指示器*/
@property (nonatomic,weak) UIView *indicatorView;

/*选中的按钮*/
@property (nonatomic,weak) UIButton *selButton;

/*指示条*/
@property (nonatomic,weak) UIView *titleView;
@end

@implementation WJEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化控制器的导航栏和背景
    [self setupNav];

    //初始化导航条下边的指示器
    [self setupTitlesView];
    
    [self setupScrollView];
    
    
  
}

- (void)setupScrollView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *contentView = [[UIScrollView alloc] init];
    
    contentView.frame = self.view.bounds;
    [contentView.backgroundColor = [UIColor greenColor] colorWithAlphaComponent:0.3];

    CGFloat top = CGRectGetMaxY(self.titleView.frame);
    CGFloat bottom = self.tabBarController.tabBar.height;
    contentView.contentInset = UIEdgeInsetsMake(top, 0, 0, bottom);
    [self.view insertSubview:contentView atIndex:0];
    
    
    //测试
    UISwitch *swich = [[UISwitch alloc] init];
    swich.backgroundColor = [UIColor yellowColor];
    [contentView addSubview:swich];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.y = 800;
    [contentView addSubview:button];
    contentView.contentSize = CGSizeMake(400, 900);
    
    WJLog(@"%@",contentView);
}

- (void)setupTitlesView
{
    UIView *titleView = [[UIView alloc] init];

    titleView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    titleView.width = self.view.width;
    titleView.height = 35;
    titleView.y = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    titleView.x = 0;
    [self.view addSubview:titleView];
    self.titleView = titleView;
    
    //设置底部的指示器
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.height = 2;
    indicatorView.y = titleView.height - indicatorView.height;
    [titleView addSubview:indicatorView];
    self.indicatorView = indicatorView;
    
    //添加按钮
    NSArray *titles = @[@"全部",@"视频",@"图片",@"段子",@"网红",@"美女",@"游戏"];
    int count = 5;
    CGFloat buttonWidth = titleView.width / count;
    CGFloat buttonHeigth = titleView.height;
    CGFloat buttonY = 0;
    for (int i = 0; i < count; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.width = buttonWidth;
        button.height = buttonHeigth;
        button.x = i * button.width;
        button.y = buttonY;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        [titleView addSubview:button];
        [button addTarget:self action:@selector(titleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

        
        if (i == 0) {
            [button layoutIfNeeded];
            [self titleButtonClicked:button];
        }
    }
    
    
}




- (void)titleButtonClicked:(UIButton *)button
{
    self.selButton.enabled = YES;
    button.enabled = NO;
    self.selButton = button;
    [UIView animateWithDuration:0.2f animations:^{
        self.indicatorView.x = button.titleLabel.x + button.x;
        self.indicatorView.width = button.titleLabel.width;
    }];
    

}



- (void)buttonClicked
{
    WJRecommandTagController *tagVc= [[WJRecommandTagController alloc] init];
    [self.navigationController pushViewController:tagVc animated:YES];

}


- (void)setupNav
{
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
