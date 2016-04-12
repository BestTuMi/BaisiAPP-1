//
//  WJComment.h
//  百思不得姐
//
//  Created by wangju on 16/4/5.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WJUser;
@interface WJComment : NSObject


/** 评论的id */
@property (nonatomic,strong) NSString *id;
/** 评论的内容 */
@property (nonatomic,strong) NSString *content;

/** 评论的时间 */
@property (nonatomic,copy) NSString *ctime;

/** 点赞数 */
@property (nonatomic,assign) NSInteger like_count;

/** 评论的用户 */
@property (nonatomic,strong) WJUser *user;

/** 音频回复的时常 */
@property (nonatomic,assign) NSInteger voicetime;

/** 帖子的id */
@property (nonatomic,strong) NSString *data_id;

@end
