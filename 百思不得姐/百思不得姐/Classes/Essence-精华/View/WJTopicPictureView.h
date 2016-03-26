//
//  WJTopicPictureView.h
//  百思不得姐
//
//  Created by wangju on 16/3/26.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WJTopic;
@interface WJTopicPictureView : UIView

+ (instancetype)pictureView;

/** 帖子模型 */
@property (nonatomic,strong) WJTopic *topic;

@end
