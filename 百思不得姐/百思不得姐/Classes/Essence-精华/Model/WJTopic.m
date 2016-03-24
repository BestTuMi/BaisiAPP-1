//
//  WJTopic.m
//  百思不得姐
//
//  Created by wangju on 16/3/22.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJTopic.h"

@implementation WJTopic

- (void)setCreate_time:(NSString *)create_time
{
    _create_time = create_time;

    NSDate *now = [NSDate date];
    //获取日期
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *create = [fmt dateFromString:create_time];
    
    WJLog(@"%@",[now deltaFrom:create]);

    
}


@end
