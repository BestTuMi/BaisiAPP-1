//
//  WJRecommendTagCell.m
//  百思不得姐
//
//  Created by wangju on 16/3/17.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJRecommendTagCell.h"
#import "WJRecommendTag.h"
#import <UIImageView+WebCache.h>

@interface WJRecommendTagCell()

@property (weak, nonatomic) IBOutlet UIImageView *listImageView;
@property (weak, nonatomic) IBOutlet UILabel *themeLabel;

@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;

@end

@implementation WJRecommendTagCell

- (void)setReTag:(WJRecommendTag *)reTag
{
    
    _reTag = reTag;
    
    [self.listImageView sd_setImageWithURL:[NSURL URLWithString:reTag.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.themeLabel.text = reTag.theme_name;
    self.subNumberLabel.text = [NSString stringWithFormat:@"%zd人订阅",reTag.sub_number];
    

}

- (void)setFrame:(CGRect)frame
{
    frame.origin.x = 10;
    frame.size.width -= 20;
    frame.size.height -= 1;
    [super setFrame:frame];
}


- (void)awakeFromNib {
    // Initialization code
    self.listImageView.layer.cornerRadius = 5;
    self.listImageView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
