//
//  WJProgressView.h
//  百思不得姐
//
//  Created by wangju on 16/3/29.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DALabeledCircularProgressView.h>

@interface WJProgressView : DALabeledCircularProgressView

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end
