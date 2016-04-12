//
//  WJCommentCellTableViewCell.h
//  百思不得姐
//
//  Created by wangju on 16/4/12.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WJComment;
@interface WJCommentCellTableViewCell : UITableViewCell

/** 评论模型 */
@property (nonatomic,strong) WJComment *comment;


@end
