//
//  WJRecommondUser.h
//  百思不得姐
//
//  Created by wangju on 16/3/16.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJRecommondUser : NSObject

/*粉丝数量*/
@property (nonatomic,assign) NSInteger fans_count;

/*头像*/
@property (nonatomic,copy) NSString *header;

/*名称*/
@property (nonatomic,copy) NSString *screen_name;





@end
