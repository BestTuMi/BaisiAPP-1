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
#import "WJTopicPictureView.h"
#import "WJTopicVoiceView.h"
#import "WJTopicVideoView.h"

@interface WJTopicCell()

@property (weak, nonatomic) IBOutlet UILabel *nameBLabel;

@property (weak, nonatomic) IBOutlet UILabel *create_timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profile_imageView;

@property (weak, nonatomic) IBOutlet UIButton *ding;
@property (weak, nonatomic) IBOutlet UIButton *cai;
@property (weak, nonatomic) IBOutlet UIButton *repost;
@property (weak, nonatomic) IBOutlet UIButton *conmmentButton;
@property (weak, nonatomic) IBOutlet UILabel *text_label;

@property (weak, nonatomic) IBOutlet UIImageView *sina_vView;


/** 图片视图 */
@property (nonatomic,weak) WJTopicPictureView *pictureView;

/** 声音帖子中间的内容 */
@property (nonatomic,strong) WJTopicVoiceView *voiceView;

/** 视频帖子中间的内容 */
@property (nonatomic,strong) WJTopicVideoView *videoView;

@end

@implementation WJTopicCell


- (WJTopicVideoView *)videoView
{
    if (_videoView == nil) {
        WJTopicVideoView *videoVide = [WJTopicVideoView videoView];
        [self.contentView addSubview:videoVide];
        _videoView = videoVide;
    }
    return _videoView;
}
- (WJTopicPictureView *)pictureView
{
    if (_pictureView == nil) {
        WJTopicPictureView *picView = [WJTopicPictureView pictureView];
        [self.contentView addSubview:picView];
        _pictureView = picView;
    }
    return _pictureView;
}

- (WJTopicVoiceView *)voiceView
{
    if (_voiceView == nil) {
        WJTopicVoiceView *voiceView = [WJTopicVoiceView voiceView];
        [self.contentView addSubview:voiceView];
        _voiceView = voiceView;
    }
    return _voiceView;
}

- (void)awakeFromNib {
    
    UIImageView *bgView = [[UIImageView alloc] init];
    bgView.image = [UIImage imageNamed:@"mainCellBackground"];
    self.backgroundView = bgView;
    
    
}


- (void)setTopic:(WJTopic *)topic
{
    _topic = topic;
    
    self.nameBLabel.text = topic.name;
    self.create_timeLabel.text = topic.create_time;
    
    self.sina_vView.hidden = !topic.isSina_V;
    [self.profile_imageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    self.text_label.text = topic.text;
    
    [self setButtonTitle:self.ding count:topic.ding placeholder:@"顶"];
    [self setButtonTitle:self.cai count:topic.cai placeholder:@"踩"];
    [self setButtonTitle:self.repost count:topic.repost placeholder:@"转发"];
    [self setButtonTitle:self.conmmentButton count:topic.comment placeholder:@"评论"];
    
    //添加图片
    if (topic.type == WJTopeTypePicture) {
        self.pictureView.hidden = NO;
        self.voiceView.hidden = YES;
        self.videoView.hidden = YES;
        self.pictureView.topic = topic;
        self.pictureView.frame = topic.pictureFrame;
    }
    else if(topic.type == WJTopeTypeSound)
    {
        self.pictureView.hidden = YES;
        self.videoView.hidden = YES;
        self.voiceView.hidden = NO;
        self.voiceView.topic = topic;
        self.voiceView.frame = topic.voiceFrame;
    }
    else if (topic.type == WJTopeTypeVideo)
    {
        self.pictureView.hidden = YES;
        self.voiceView.hidden = YES;
        self.videoView.hidden = NO;
        self.videoView.topic = topic;
        self.videoView.frame = topic.videoFrame;
    
    }
    else
    {
        self.pictureView.hidden = YES;
        self.voiceView.hidden = YES;
        self.videoView.hidden = YES;
    
    }
    
}


- (void)setButtonTitle:(UIButton *)button count:(NSInteger)count placeholder:(NSString *)str
{

    if (count > 10000) {
        str = [NSString stringWithFormat:@"%0.1f万",count / 10000.0];
    }
    else if(count > 0)
    {
        str = [NSString stringWithFormat:@"%zd",count];
    }
    
    [button setTitle:str forState:UIControlStateNormal];
}
- (void)setFrame:(CGRect)frame
{
    
    CGFloat margin = 8;
    
    frame.size.height -= margin;
    frame.origin.y += margin;
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
