//
//  WJTabberController.m
//  百思不得姐
//
//  Created by wangju on 16/3/13.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJTabberController.h"
#import "WJTabbar.h"

@interface WJTabberController ()

@end

@implementation WJTabberController

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
    UIViewController *essence = [[UIViewController alloc] init];
    [self addChildViewController:essence title:@"精华" barimage:@"tabBar_essence_icon" barSelectedImage:@"tabBar_essence_click_icon"];
    
    UIViewController *new = [[UIViewController alloc] init];
    [self addChildViewController:new title:@"新帖" barimage:@"tabBar_new_icon" barSelectedImage:@"tabBar_new_click_icon"];
    
    UIViewController *friendTrends = [[UIViewController alloc] init];
    [self addChildViewController:friendTrends title:@"关注" barimage:@"tabBar_friendTrends_icon" barSelectedImage:@"tabBar_friendTrends_click_icon"];
    
    UIViewController *me = [[UIViewController alloc] init];
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
    childController.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1];
    
    [self addChildViewController:childController];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
