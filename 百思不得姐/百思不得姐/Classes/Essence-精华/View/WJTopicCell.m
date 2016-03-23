//
//  WJTopicCell.m
//  百思不得姐
//
//  Created by wangju on 16/3/23.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJTopicCell.h"
#import "WJTopic.h"
#import <UIImageView+WebCache.h>

@interface WJTopicCell()

@property (weak, nonatomic) IBOutlet UILabel *nameBLabel;

@property (weak, nonatomic) IBOutlet UILabel *create_timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profile_imageView;

@property (weak, nonatomic) IBOutlet UIButton *ding;
@property (weak, nonatomic) IBOutlet UIButton *cai;
@property (weak, nonatomic) IBOutlet UIButton *repost;
@property (weak, nonatomic) IBOutlet UIButton *conmmentButton;

@end

@implementation WJTopicCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setTopic:(WJTopic *)topic
{
    _topic = topic;
    
    self.nameBLabel.text = topic.name;
    self.create_timeLabel.text = topic.create_time;
    
    
    [self.profile_imageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
//    self.profile_imageView.layer.cornerRadius = self.profile_imageView.bounds.size.width * 0.5;
//    self.profile_imageView.layer.masksToBounds = YES;
    [self.ding setTitle:[NSString stringWithFormat:@"%zd",topic.ding] forState:UIControlStateNormal];
    [self.cai setTitle:[NSString stringWithFormat:@"%zd",topic.cai] forState:UIControlStateNormal];
    [self.repost setTitle:[NSString stringWithFormat:@"%zd",topic.repost] forState:UIControlStateNormal];
    [self.conmmentButton setTitle:[NSString stringWithFormat:@"%zd",topic.comment] forState:UIControlStateNormal];
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.x = 5;
    frame.size.width -= 10;
    frame.size.height -= 3;
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
