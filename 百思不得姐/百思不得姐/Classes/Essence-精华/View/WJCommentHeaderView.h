//
//  WJCommentHeaderView.h
//  百思不得姐
//
//  Created by wangju on 16/4/9.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJCommentHeaderView : UITableViewHeaderFooterView

/** 头标题的文字 */
@property (nonatomic,copy) NSString *text;


+ (instancetype)headerWithTableview:(UITableView *)tableview;
@end
