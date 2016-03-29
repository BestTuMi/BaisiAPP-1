//
//  WJShowPictureController.m
//  百思不得姐
//
//  Created by wangju on 16/3/29.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJShowPictureController.h"
#import "WJTopic.h"
#import <UIImageView+WebCache.h>
#import <SVProgressHUD.h>
#import "WJProgressView.h"

@interface WJShowPictureController ()

/** 显示的图片 */
@property (nonatomic,weak) UIImageView *bigImage;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet WJProgressView *progressView;

@end

@implementation WJShowPictureController

- (UIImageView *)bigImage
{
    if (_bigImage == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        CGFloat picW = screenSize.width;
        CGFloat picH = picW * self.topic.height / self.topic.width;
        imageView.size = CGSizeMake(picW, picH);
        if (picH > screenSize.height) {
            imageView.frame = CGRectMake(0, 0, picW, picH);
            self.scrollView.contentSize = CGSizeMake(0, picH);
        }
        else
        {
            imageView.centerY= screenSize.height * 0.5;
            
            
        }
        
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back:)]];
        
        
        [self.scrollView addSubview:imageView];
        _bigImage = imageView;
    
        
        
    }
    return _bigImage;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    
    [self.progressView setProgress:self.topic.picProgress animated:NO];

    [self.bigImage sd_setImageWithURL:[NSURL URLWithString:self.topic.large_image] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (receivedSize == -0) {receivedSize = 0;}
        
        self.progressView.hidden = NO;
        self.topic.picProgress = (1.0 * receivedSize / expectedSize);
        [self.progressView setProgress:self.topic.picProgress animated:NO];
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.progressView.hidden = YES;
        
    }];
    
    
}
- (IBAction)back:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    WJLogFunc;
    [self dismissViewControllerAnimated:NO completion:nil];

}

- (IBAction)savePicture:(id)sender {
    if (self.bigImage.image == nil)
    {
        [SVProgressHUD showErrorWithStatus:@"图片还没下载完毕，无法保存"];
        return;
    }
    
    UIImageWriteToSavedPhotosAlbum(self.bigImage.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) {
        [SVProgressHUD showErrorWithStatus:@"保存失败！"];
    }
    else
    {
        [SVProgressHUD showSuccessWithStatus:@"保存成功！"];
    }

}

@end
