//
//  WJPushGuide.m
//  百思不得姐
//
//  Created by wangju on 16/3/20.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJPushGuide.h"

@implementation WJPushGuide

+ (instancetype)pushGuide
{

    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject;
}
- (IBAction)close {
    [self removeFromSuperview];
}


+ (void)show
{
    NSString *key = @"CFBundleShortVersionString";
    
    NSString *version = [NSBundle mainBundle].infoDictionary[key];
    
    NSString *perVersion = [[NSUserDefaults standardUserDefaults] valueForKey:key];
    
    if ([version isEqualToString:perVersion]) return;
    
    
    UIView *window = [UIApplication sharedApplication].keyWindow;
    UIView *pushGuide = [self pushGuide];
    pushGuide.frame = window.frame;
    [window addSubview:pushGuide];
    
    [[NSUserDefaults standardUserDefaults] setObject:version forKey:key];
    //存储版本信息
    [[NSUserDefaults standardUserDefaults] synchronize];

}

@end
