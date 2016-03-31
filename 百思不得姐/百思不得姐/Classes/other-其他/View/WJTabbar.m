//
//  WJTabbar.m
//  百思不得姐
//
//  Created by wangju on 16/3/13.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJTabbar.h"
#import "WJPublishView.h"

@interface WJTabbar()

/*发布按钮*/
@property (nonatomic,weak) UIButton *centerButton;

@end

@implementation WJTabbar


/*
 * 添加tabbar中间的发布按钮
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //设置tabbar的背景色
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        
        UIButton *centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [centerButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [centerButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        [centerButton addTarget:self action:@selector(publishButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:centerButton];
        
        self.centerButton = centerButton;
    }

    return self;
}



/**
 *  重新排布tabbar按钮
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.centerButton.frame = CGRectMake(0, 0, self.centerButton.currentImage.size.width, self.centerButton.currentImage.size.height);
    
    self.centerButton.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    
    
    
    CGFloat viewX = 0;
    CGFloat viewY = 0;
    CGFloat viewH = self.height;
    CGFloat viewW = self.width / 5;
    NSInteger index = 0;
    for (UIView  *view in self.subviews) {
        
        if (![view isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
       
        viewX = viewW * ((index > 1) ? (index + 1) : index);
        view.frame = CGRectMake(viewX, viewY, viewW, viewH);

        index++;
    }
    
    

}



- (void)publishButtonClicked
{

    [WJPublishView show];

}

@end
