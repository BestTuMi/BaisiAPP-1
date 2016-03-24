//
//  NSDate+WJExtension.h
//  百思不得姐
//
//  Created by wangju on 16/3/24.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (WJExtension)

- (NSDateComponents *)deltaFrom:(NSDate *)date;

/**
 *  是否为今年
 */
- (BOOL)isThisYear;
/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
@end
