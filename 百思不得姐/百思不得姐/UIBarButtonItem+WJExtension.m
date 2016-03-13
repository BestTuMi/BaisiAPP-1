//
//  UIBarButtonItem+WJExtension.m
//  百思不得姐
//
//  Created by wangju on 16/3/13.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "UIBarButtonItem+WJExtension.h"

@implementation UIBarButtonItem (WJExtension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateNormal];
    button.size = button.currentImage.size;
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return  [[self alloc] initWithCustomView:button];
}

@end
