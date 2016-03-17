//
//  WJRecommendTag.h
//  百思不得姐
//
//  Created by wangju on 16/3/17.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJRecommendTag : NSObject
/*图片*/
@property (nonatomic,strong) NSString *image_list;

/*订阅数*/
@property (nonatomic,assign) NSUInteger sub_number;

/*标签名称*/
@property (nonatomic,strong) NSString *theme_name;

/*标签id*/
@property (nonatomic,assign) NSUInteger theme_id;

@end
