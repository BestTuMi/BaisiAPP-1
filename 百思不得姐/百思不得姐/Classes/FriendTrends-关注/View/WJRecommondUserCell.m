//
//  WJRecommondUserCell.m
//  百思不得姐
//
//  Created by wangju on 16/3/16.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJRecommondUserCell.h"
#import "WJRecommondUser.h"
#import <UIImageView+WebCache.h>

@interface WJRecommondUserCell()

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;

@end

@implementation WJRecommondUserCell


- (void)setUser:(WJRecommondUser *)user
{
    _user  = user;
    
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"cellFollowIcon"]];
    self.screenNameLabel.text = user.screen_name;
    self.fansCountLabel.text = [NSString stringWithFormat:@"%zd人关注",user.fans_count];

}

- (void)awakeFromNib {
    // Initialization code
    self.headerImageView.layer.cornerRadius = self.headerImageView.width * 0.5f;
    self.headerImageView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
