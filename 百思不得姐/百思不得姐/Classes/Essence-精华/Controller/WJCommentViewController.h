//
//  WJCommentViewController.h
//  百思不得姐
//
//  Created by wangju on 16/4/5.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WJTopic;
@interface WJCommentViewController : UIViewController

/** 帖子模型 */
@property (nonatomic,strong) WJTopic *topic;

@end
