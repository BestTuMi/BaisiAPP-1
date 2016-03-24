//
//  NSDate+WJExtension.m
//  百思不得姐
//
//  Created by wangju on 16/3/24.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "NSDate+WJExtension.h"

@implementation NSDate (WJExtension)

- (NSDateComponents *)deltaFrom:(NSDate *)date
{
    //日历
    NSCalendar *calendar = [NSCalendar currentCalendar];

    NSCalendarUnit unit = NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitMonth|NSCalendarUnitYear;

    return [calendar components:unit fromDate:date toDate:self options:0];
}

- (BOOL)isThisYear
{
    //日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //当前年份
    NSInteger thisYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    //创建帖子年份
    NSInteger createYear = [calendar component:NSCalendarUnitYear fromDate:self];
    
    return thisYear == createYear;
}

- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
    NSDateComponents *now = [calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *create = [calendar components:unit fromDate:self];
    
    return now.year == create.year
    && now.month == create.month
    && now.day == create.day;

}

- (BOOL)isYesterday
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSDate *nowDate = [fmt dateFromString:[fmt stringFromDate:[NSDate date]]];
    NSDate *createDate = [fmt dateFromString:[fmt stringFromDate:self]];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitMonth|NSCalendarUnitYear;
    
    NSDateComponents *comps = [calendar components:unit fromDate:createDate toDate:nowDate options:0];
    
    return comps.year == 0
    && comps.month == 0
    && comps.day == 1;

}



@end
