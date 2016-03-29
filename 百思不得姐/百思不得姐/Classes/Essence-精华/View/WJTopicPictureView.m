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
#import "WJProgressView.h"
#import "WJShowPictureController.h"

@interface WJTopicPictureView()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *gifView;

@property (weak, nonatomic) IBOutlet UIButton *seeBigButton;
@property (weak, nonatomic) IBOutlet WJProgressView *progressView;

@end

@implementation WJTopicPictureView

- (void)awakeFromNib
{
    self.autoresizingMask = UIViewAutoresizingNone;
    
    //给图片添加坚挺器
    self.imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPicture)];
    [self.imageView addGestureRecognizer:tap];
    

}

+ (instancetype)pictureView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)setTopic:(WJTopic *)topic
{
    _topic = topic;
    
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (receivedSize == -0) {receivedSize = 0;}
        
        self.progressView.hidden = NO;
        topic.picProgress = (1.0 * receivedSize / expectedSize);
        [self.progressView setProgress:topic.picProgress animated:NO];
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.progressView.hidden = YES;
        
        if (!self.topic.isBigImage) return;
        
        
        UIGraphicsBeginImageContextWithOptions(topic.pictureFrame.size, NO, 0.0);
        CGFloat picW = screenSize.width;
        CGFloat picH = picW * self.topic.height / self.topic.width;
        [image drawInRect:CGRectMake(0, 0, picW, picH)];
        self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        
    }];

    //判断是否为gif
    NSString *extension = topic.large_image.pathExtension;
    self.gifView.hidden = ![extension.lowercaseString isEqualToString:@"gif"];
   
    if (topic.isBigImage) {
        self.seeBigButton.hidden = NO;
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    else
    {
        self.seeBigButton.hidden = YES;
    
        self.imageView.contentMode = UIViewContentModeScaleToFill;
    }
    
    
}

- (void)showPicture
{
    WJShowPictureController *showPicVc = [[WJShowPictureController alloc] init];
    showPicVc.topic = self.topic;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:showPicVc animated:NO completion:nil];

}


@end
