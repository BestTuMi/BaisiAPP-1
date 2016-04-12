//
//  WJCommentCellTableViewCell.m
//  百思不得姐
//
//  Created by wangju on 16/4/12.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJCommentCellTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "WJComment.h"
#import "WJUser.h"

@interface WJCommentCellTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *profile_image;

@property (weak, nonatomic) IBOutlet UIImageView *seximageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;

@end

@implementation WJCommentCellTableViewCell

- (void)setComment:(WJComment *)comment
{
    _comment = comment;
    
    
    [self.profile_image sd_setImageWithURL:[NSURL URLWithString:comment.user.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    

    self.seximageView.image = [comment.user.sex isEqualToString:WJTopicUserSexMale]?[UIImage imageNamed:@"Profile_manIcon"] : [UIImage imageNamed:@"Profile_womanIcon"];
    self.nameLabel.text = comment.user.username;
    self.contentLabel.text = comment.content;
    self.likeCount.text = [NSString stringWithFormat:@"%zd",comment.like_count];
    self.profile_image.layer.cornerRadius = self.profile_image.width * 0.5;
    self.profile_image.layer.masksToBounds = YES;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
