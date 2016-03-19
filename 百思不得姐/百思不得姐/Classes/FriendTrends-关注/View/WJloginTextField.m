//
//  WJloginTextField.m
//  百思不得姐
//
//  Created by wangju on 16/3/19.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJloginTextField.h"
#import <objc/runtime.h>

@implementation WJloginTextField

/**
 *  运行时(RunTime)
 */
+ (void)initialize
{
    unsigned count = 0;
    Ivar *ivar = class_copyIvarList([UITextField class], &count);
    
    for (int i = 0; i < count; i++) {
        WJLog(@"%s",ivar_getName(ivar[i]));
    }
    
    //结束的时候释放内存
    free(ivar);
    WJLogFunc;

}



- (BOOL)becomeFirstResponder
{
    UIColor *textColor = [UIColor whiteColor];
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName:textColor}];

//    self.tintColor = textColor;
   return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{

    UIColor *textColor = [UIColor colorWithWhite:0.7 alpha:1];
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName:textColor}];
//    self.tintColor = textColor;
    return [super resignFirstResponder];
}

- (void)awakeFromNib
{
    self.tintColor = self.textColor;
    [self resignFirstResponder];
    //通过kvc改变私有变量的属性
//    [self setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    
//    UILabel *l = [self valueForKeyPath:@"_placeholderLabel"];
//    l.text = @"dfdfddf";
}

@end
