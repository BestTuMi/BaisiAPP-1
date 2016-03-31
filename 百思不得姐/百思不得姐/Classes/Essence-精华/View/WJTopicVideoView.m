//
//  WJTopicVideoView.m
//  百思不得姐
//
//  Created by wangju on 16/4/1.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJTopicVideoView.h"
#import "WJTopic.h"
#import <UIImageView+WebCache.h>
#import "WJShowPictureController.h"


@interface WJTopicVideoView()


@property (weak, nonatomic) IBOutlet UILabel *playcountLabel;

@property (weak, nonatomic) IBOutlet UILabel *videotimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation WJTopicVideoView

+ (instancetype)videoView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)setTopic:(WJTopic *)topic
{
    _topic = topic;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];
    
    //播放次数
    self.playcountLabel.text = [NSString stringWithFormat:@"%zd次播放",topic.playcount];
    
    //播放时常
    NSInteger minute = topic.videotime / 60;
    NSInteger second = topic.videotime % 60;
    self.videotimeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd",minute,second];
}

- (void)awakeFromNib
{
    self.autoresizingMask = UIViewAutoresizingNone;
    
    //给图片添加坚挺器
    self.imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPicture)];
    [self.imageView addGestureRecognizer:tap];
    
}

- (void)showPicture
{
    WJShowPictureController *showPicVc = [[WJShowPictureController alloc] init];
    showPicVc.topic = self.topic;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:showPicVc animated:NO completion:nil];
    
}

- (void)playVoice
{
    WJLogFunc;
    
}

@end
