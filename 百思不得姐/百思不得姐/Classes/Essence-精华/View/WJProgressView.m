//
//  WJProgressView.m
//  百思不得姐
//
//  Created by wangju on 16/3/29.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJProgressView.h"

@implementation WJProgressView

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    [super setProgress:progress animated:animated];
    

    self.progressLabel.textColor = [UIColor whiteColor];
    self.progressLabel.text = [NSString stringWithFormat:@"%.0f%%",(1.0 * progress) * 100];
    
}


- (void)awakeFromNib
{
    self.roundedCorners = 10;
    self.progressTintColor = [UIColor whiteColor];
    self.progressLabel.font = [UIFont systemFontOfSize:22];
}
@end
