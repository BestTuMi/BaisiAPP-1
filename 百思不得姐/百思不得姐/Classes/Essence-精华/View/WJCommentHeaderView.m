//
//  WJCommentHeaderView.m
//  百思不得姐
//
//  Created by wangju on 16/4/9.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJCommentHeaderView.h"

@implementation WJCommentHeaderView


+ (instancetype)headerWithTableview:(UITableView *)tableview
{
    static NSString *const headerID = @"header";
    WJCommentHeaderView *view = [tableview dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    
    if (view == nil) {
        view = [[WJCommentHeaderView alloc] initWithReuseIdentifier:headerID];
    }
    
    return view;

}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UILabel *label = [[UILabel alloc] init];
        
        label.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        label.x = 10;
        label.width = screenSize.width - 2 * label.x;
        label.font = [UIFont systemFontOfSize:16];
        
        [self addSubview:label];
        
        self.contentView.backgroundColor = WJGlobalBGColor;
    }
    return self;
}

- (void)setText:(NSString *)text
{
    _text = [text copy];
    
    UILabel *label = [self.subviews lastObject];
    label.text = text;
    
}

@end
