//
//  WJCategoryTableViewCell.h
//  百思不得姐
//
//  Created by wangju on 16/3/16.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WJRecommondCategory;
@interface WJCategoryTableViewCell : UITableViewCell
/*模型数据*/
@property (nonatomic,strong) WJRecommondCategory *category;

@end
