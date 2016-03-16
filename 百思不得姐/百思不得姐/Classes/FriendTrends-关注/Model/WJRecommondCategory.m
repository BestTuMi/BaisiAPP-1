//
//  WJRecommondCategory.m
//  百思不得姐
//
//  Created by wangju on 16/3/16.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJRecommondCategory.h"

@implementation WJRecommondCategory

- (NSMutableArray *)users
{
    if (_users == nil) {
        _users = [NSMutableArray array];
    }
    return _users;
}

@end
