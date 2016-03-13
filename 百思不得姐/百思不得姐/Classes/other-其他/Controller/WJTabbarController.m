//
//  WJTabberController.m
//  百思不得姐
//
//  Created by wangju on 16/3/13.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJTabbarController.h"
#import "WJTabbar.h"
#import "WJEssenceController.h"
#import "WJNewController.h"
#import "WJFriendTrendsController.h"
#import "WJMeController.h"
#import "WJNavigationController.h"


@interface WJTabbarController ()

@end

@implementation WJTabbarController

+ (void)initialize
{
    
    //设置所有的导航条的选中颜色
    UITabBarItem *tabbar = [UITabBarItem appearance];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [tabbar setTitleTextAttributes:attrs forState:UIControlStateSelected];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    //添加所有子控制器
    WJEssenceController *essence = [[WJEssenceController alloc] init];
    [self addChildViewController:essence title:@"精华" barimage:@"tabBar_essence_icon" barSelectedImage:@"tabBar_essence_click_icon"];
    
    WJNewController *new = [[WJNewController alloc] init];
    [self addChildViewController:new title:@"新帖" barimage:@"tabBar_new_icon" barSelectedImage:@"tabBar_new_click_icon"];
    
    WJFriendTrendsController *friendTrends = [[WJFriendTrendsController alloc] init];
    [self addChildViewController:friendTrends title:@"关注" barimage:@"tabBar_friendTrends_icon" barSelectedImage:@"tabBar_friendTrends_click_icon"];
    
    WJMeController *me = [[WJMeController alloc] init];
    [self addChildViewController:me title:@"我" barimage:@"tabBar_me_icon" barSelectedImage:@"tabBar_me_click_icon"];
    
    //更换自定义Tabbar
//    self.tabBar = [[WJTabbar alloc] init];
    [self setValue:[[WJTabbar alloc] init] forKey:@"tabBar"];

    
  
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title barimage:(NSString *)image barSelectedImage:(NSString *)selImage
{
    
    childController.tabBarItem.title = title;
    
    childController.tabBarItem.image = [UIImage imageNamed:image];
    
    childController.tabBarItem.selectedImage = [UIImage imageNamed:selImage];
    
    childController.navigationItem.title = title;
//    一开始创建会同时创建全部的控制器
//    childController.view.backgroundColor = WJGlobalBGColor;
    //包装导航控制器
    WJNavigationController *nav = [[WJNavigationController alloc] initWithRootViewController:childController];

    [self addChildViewController:nav];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
