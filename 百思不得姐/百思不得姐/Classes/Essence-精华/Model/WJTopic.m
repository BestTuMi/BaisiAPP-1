//
//  WJTopic.m
//  百思不得姐
//
//  Created by wangju on 16/3/22.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJTopic.h"
#import <MJExtension.h>

@implementation WJTopic
{
    CGFloat _rowHeight;

    CGRect _pictureFrame;
}

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

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"small_image" : @"image0",
             @"large_image" : @"image1",
             @"middle_image" : @"image2",
             };
}


- (CGFloat)rowHeight
{
   
    if (!_rowHeight) {
        
        CGFloat maxWidth = screenSize.width - 2 * WJTopicMargin;
        
        CGSize maxsize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 2 * WJTopicMargin, MAXFLOAT);
        CGFloat textH = [self.text boundingRectWithSize:maxsize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size.height;
        _rowHeight = textH + WJTopicTextX + WJTopicMargin;
        if (self.type == WJTopeTypePicture) {
            
            CGFloat picW = maxWidth;
            CGFloat picH = self.height * maxWidth / self.width;
            CGFloat picX = WJTopicMargin;
            CGFloat picY = _rowHeight;
            _pictureFrame = CGRectMake(picX, picY, picW, picH);
            _rowHeight += (picH + WJTopicMargin);
        }
        
        _rowHeight += WJTopicBottonHeight + WJTopicMargin;
    }
//    WJLog(@"%@",NSStringFromCGRect(self.pic));
    return _rowHeight;
}



@end
