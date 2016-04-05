//
//  WJCommentViewController.m
//  百思不得姐
//
//  Created by wangju on 16/4/5.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJCommentViewController.h"

@interface WJCommentViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttomConstraint;

@end

@implementation WJCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"评论";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"comment_nav_item_share_icon" highImage:@"comment_nav_item_share_icon_click" target:nil action:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardChangedFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)keyBoardChangedFrame:(NSNotification *)noti
{

    CGRect frame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    self.buttomConstraint.constant = screenSize.height - frame.origin.y;
    
    
    //动画时间
    CGFloat duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];

}

@end
