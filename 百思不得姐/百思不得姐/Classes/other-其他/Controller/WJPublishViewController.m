//
//  WJPublishViewController.m
//  百思不得姐
//
//  Created by wangju on 16/3/31.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJPublishViewController.h"
#import "WJVerticalButton.h"
#import <POP.h>
#define buttonCol 3

#define WJAnimationDelay 0.1

@interface WJPublishViewController ()

@property (nonatomic,weak) UIImageView *slogan;


@end

@implementation WJPublishViewController

- (UIImageView *)slogan
{
    if (_slogan == nil) {
        UIImageView *appSlogan = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"app_slogan"]];
        appSlogan.y = 0 - appSlogan.height;
        appSlogan.centerX =  screenSize.width * 0.5;
        [self.view addSubview:appSlogan];
        _slogan = appSlogan;
    }

    return _slogan;

}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.userInteractionEnabled = NO;
    //下面的六个按钮
    // 数据
    NSArray *images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    NSArray *titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"离线下载"];
    
    CGFloat buttonW = 72;
    CGFloat ButtonH = buttonW + 30;
    
    CGFloat startX = 15;
    CGFloat centerPadding = (screenSize.width - 2 * startX - buttonCol * buttonW) / (buttonCol - 1);
    CGFloat paddingY = 10;
    CGFloat startY = (screenSize.height - 2 * ButtonH - paddingY) * 0.5;
    
    CGFloat buttonX = 0;
    CGFloat buttonY = 0;
    
    for (int i = 0; i < 6; i++) {
        
        CGFloat col = i % buttonCol;//列
        CGFloat row = i / buttonCol;//行
        
        WJVerticalButton *button = [[WJVerticalButton alloc] init];
       
        buttonX = startX + col * (buttonW + centerPadding);
        buttonY = startY + (ButtonH + paddingY)* row;
        
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.view addSubview:button];
        
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat fromY = 0 - ButtonH;
        //添加动画
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        anim.fromValue = [NSValue valueWithCGRect:CGRectMake(buttonX, fromY, buttonW, ButtonH)];
        anim.toValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonY, buttonW, ButtonH)];
        anim.springBounciness = 10;
        anim.springSpeed = 20;
        anim.beginTime = CACurrentMediaTime() + WJAnimationDelay * i;
        
        [button pop_addAnimation:anim forKey:nil];

    }
    
    //标语动画
    CGFloat toY = screenSize.height * 0.15;
    CGFloat centerX = screenSize.width * 0.5;
   
    POPSpringAnimation *sloganAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    sloganAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, toY)];
    sloganAnim.beginTime = CACurrentMediaTime() + WJAnimationDelay * 6;
    sloganAnim.springBounciness = 10;
    sloganAnim.springSpeed = 20;
    [self.slogan pop_addAnimation:sloganAnim forKey:nil];

    [sloganAnim setCompletionBlock:^(POPAnimation *anim, BOOL finish) {
        self.view.userInteractionEnabled = YES;
    }];
    
}


- (IBAction)cancel {
    [self cancelWithCompleteBlock:nil];
    
}

- (void)buttonClicked:(WJVerticalButton *)button
{
    [self cancelWithCompleteBlock:^{
        if ([button.titleLabel.text isEqualToString:@"发视频"]) {
            WJLog(@"发视频");
        }else if ([button.titleLabel.text isEqualToString:@"发图片"])
        {
            WJLog(@"发图片");
        }else if ([button.titleLabel.text isEqualToString:@"发段子"])
        {
            WJLog(@"发段子");
            
        }
    }];



}


- (void)cancelWithCompleteBlock:(void (^)())completeBlock
{
    self.view.userInteractionEnabled = NO;
    
    CGFloat i = 0;
    
    for (WJVerticalButton *verButton in self.view.subviews) {
        if ([verButton isKindOfClass:[WJVerticalButton class]])
        {
            POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
            anim.toValue = [NSValue valueWithCGPoint:CGPointMake(verButton.centerX, screenSize.height + verButton.height)];
            anim.beginTime = CACurrentMediaTime() + WJAnimationDelay * (i++);
            [verButton pop_addAnimation:anim forKey:nil];
            
        }
    }
    
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(self.slogan.centerX, screenSize.height + self.slogan.height)];
    anim.beginTime = CACurrentMediaTime() + WJAnimationDelay * (i++);
    [self.slogan pop_addAnimation:anim forKey:nil];
    
    [anim setCompletionBlock:^(POPAnimation *anim, BOOL finish) {
        [self dismissViewControllerAnimated:NO completion:nil];
        !completeBlock ? : completeBlock();
    }];

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self cancelWithCompleteBlock:nil];

}

@end
