//
//  WJTopic.m
//  百思不得姐
//
//  Created by wangju on 16/3/22.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJTopic.h"

@implementation WJTopic


- (NSString *)create_time
{
    //获取日期
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *create = [fmt dateFromString:_create_time];
    
    if (create.isThisYear) {
        if (create.isToday) {
            NSDateComponents *cmps = [[NSDate date] deltaFrom:create];
            if (cmps.hour >= 1) {
                return [NSString stringWithFormat:@"%zd小时前",cmps.hour];
            }else if(cmps.minute >=1)
            {
                return [NSString stringWithFormat:@"%zd分钟前",cmps.minute];
            }else
            {
                return @"刚刚";
            }
            
        } else if(create.isYesterday)
        {
            fmt.dateFormat = @"昨天 HH:mm:ss";
            return [fmt stringFromDate:create];
        }else
        {
            fmt.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt stringFromDate:create];
        }
    }
    else
    {
        return _create_time;
    }
    

}


@end
