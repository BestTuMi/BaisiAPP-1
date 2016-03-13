//
//  UIBarButtonItem+WJExtension.h
//  百思不得姐
//
//  Created by wangju on 16/3/13.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (WJExtension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
