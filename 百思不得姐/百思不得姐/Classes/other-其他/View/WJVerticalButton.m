//
//  WJVerticalButton.m
//  百思不得姐
//
//  Created by wangju on 16/3/19.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJVerticalButton.h"

@implementation WJVerticalButton



- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    
    CGRect rect = contentRect;
    rect.origin.x = 0;
    rect.origin.y = 0;
    rect.size.height = rect.size.width;
    return rect;
    
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect rect = contentRect;
    rect.origin.x = 0;
    rect.origin.y = self.size.width + 5;
    rect.size.height = self.height - self.width;
    return rect;
}

@end
