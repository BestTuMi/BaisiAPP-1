//
//  WJTopic.h
//  百思不得姐
//
//  Created by wangju on 16/3/22.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJTopic : NSObject
/** 名称 */
@property (nonatomic,copy) NSString *name;

/** 发帖时间 */
@property (nonatomic,copy) NSString *create_time;

/** 顶的人数 */
@property (nonatomic,assign) NSInteger ding;

/** 喜欢的人数 */
@property (nonatomic,assign) NSInteger favourite;

/** 踩的人数 */
@property (nonatomic,assign) NSInteger cai;

/** 转发的人数 */
@property (nonatomic,assign) NSInteger repost;

/** 评论数 */
@property (nonatomic,assign) NSInteger comment;
/** 文本内容 */
@property (nonatomic,copy) NSString *text;

/** 头像URL */
@property (nonatomic,copy) NSString *profile_image;

/** 是否为新浪会员 */
@property (nonatomic,assign,getter=isSina_V) BOOL *sina_v;

/** 小图 */
@property (nonatomic,copy) NSString *small_image;

/** 大图 */
@property (nonatomic,copy) NSString *large_image;
/** 中图 */
@property (nonatomic,copy) NSString *middle_image;

/** 图片的宽度 */
@property (nonatomic,assign) CGFloat width;
/** 图片的高度 */
@property (nonatomic,assign) CGFloat height;

/** 段子的属性 */
@property (nonatomic,assign) WJTopicType type;

/** 音频时常 */
@property (nonatomic,assign) NSInteger voicetime;
/** 视频时常 */
@property (nonatomic,assign) NSInteger videotime;
/** 播放次数 */
@property (nonatomic,assign) NSInteger playcount;

/** 音频url */
@property (nonatomic,copy) NSString *voiceuri;

/** 视频url */
@property (nonatomic,copy) NSString *videouri;

/** 最热 */
@property (nonatomic,strong) NSArray *top_cmt;

/**
 *  辅助的属性***************************
 */
/** cell的高度 */
@property (nonatomic,assign,readonly) CGFloat rowHeight;

/** 图片控件的frame */
@property (nonatomic,assign,readonly) CGRect pictureFrame;

/** 音频控件的frame */
@property (nonatomic,assign,readonly) CGRect voiceFrame;

/** 视频控件的frame */
@property (nonatomic,assign,readonly) CGRect videoFrame;

/** 是否为长图 */
@property (nonatomic,assign,getter=isBigImage) BOOL bigImage;

/** 当前图片的下载进度值 */
@property (nonatomic,assign) NSInteger picProgress;

@end
