//
//  WJTopicPictureView.m
//  百思不得姐
//
//  Created by wangju on 16/3/26.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJTopicPictureView.h"
#import "WJTopic.h"
#import <UIImageView+WebCache.h>

@interface WJTopicPictureView()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *gifView;

@property (weak, nonatomic) IBOutlet UIButton *seeBigButton;

@end

@implementation WJTopicPictureView

- (void)awakeFromNib
{
    self.autoresizingMask = UIViewAutoresizingNone;

}

+ (instancetype)pictureView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)setTopic:(WJTopic *)topic
{
    _topic = topic;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];

    //判断是否为gif
    NSString *extension = topic.large_image.pathExtension;
    self.gifView.hidden = ![extension.lowercaseString isEqualToString:@"gif"];
   
    if (topic.pictureFrame.size.height > WJTopicPictureMaxHeight) {
        self.seeBigButton.hidden = NO;
    }
    else
    {
        self.seeBigButton.hidden = YES;
    
    }
    
    
}


@end
