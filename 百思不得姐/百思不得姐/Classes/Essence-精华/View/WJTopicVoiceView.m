//
//  WJTopicVoiceView.m
//  百思不得姐
//
//  Created by wangju on 16/3/31.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJTopicVoiceView.h"
#import <UIImageView+WebCache.h>
#import "WJTopic.h"

@interface WJTopicVoiceView()


@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *voiceTimeLabel;

@end

@implementation WJTopicVoiceView

+ (instancetype)voiceView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)setTopic:(WJTopic *)topic
{
    _topic = topic;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];

    //播放次数
    self.playCountLabel.text = [NSString stringWithFormat:@"%zd次播放",topic.playcount];
    
   //播放时常
    NSInteger minute = topic.voicetime / 60;
    NSInteger second = topic.voicetime % 60;
    self.voiceTimeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd",minute,second];
}

- (void)awakeFromNib
{
    self.autoresizingMask = UIViewAutoresizingNone;
    
    //给图片添加坚挺器
    self.imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(playVoice)];
    [self.imageView addGestureRecognizer:tap];
    
}

- (void)playVoice
{
    WJLogFunc;

}
@end
