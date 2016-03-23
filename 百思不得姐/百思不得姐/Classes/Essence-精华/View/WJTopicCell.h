//
//  WJTopicCell.h
//  百思不得姐
//
//  Created by wangju on 16/3/23.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WJTopic;
@interface WJTopicCell : UITableViewCell

/*帖子模型*/
@property (nonatomic,strong) WJTopic *topic;

@end
