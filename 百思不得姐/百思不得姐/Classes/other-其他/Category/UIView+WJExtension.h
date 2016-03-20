//
//  UIView+WJExtension.h
//  百思不得姐
//
//  Created by wangju on 16/3/13.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WJExtension)


- (void)setHeight:(CGFloat)height;
- (CGFloat)height;

- (void)setWidth:(CGFloat)width;
- (CGFloat)width;

- (void)setX:(CGFloat)x;
- (CGFloat)x;

- (void)setY:(CGFloat)y;
- (CGFloat)y;


- (void)setSize:(CGSize)size;
- (CGSize)size;

@property (nonatomic,assign) CGFloat centerX;

@end
