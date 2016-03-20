//
//  WJCategoryTableViewCell.m
//  百思不得姐
//
//  Created by wangju on 16/3/16.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJCategoryTableViewCell.h"
#import "WJRecommondCategory.h"

@interface WJCategoryTableViewCell()
@property (weak, nonatomic) IBOutlet UIView *selecterIndecator;



@end

@implementation WJCategoryTableViewCell

- (void)setCategory:(WJRecommondCategory *)category
{
    _category = category;
    
    self.textLabel.text = category.name;
    
}


- (void)awakeFromNib {

    self.textLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    //调整textlable从而显示底部分割线
    self.textLabel.y = 1;
    self.textLabel.height = self.contentView.height - self.textLabel.y * 2;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    self.selecterIndecator.hidden = !selected;
    
    self.textLabel.textColor = selected?WJRGBColor(219, 21, 76):WJRGBColor(120, 120, 120);
    self.backgroundColor = selected?[UIColor whiteColor]:WJGlobalBGColor;
    
    // Configure the view for the selected state
}


@end
