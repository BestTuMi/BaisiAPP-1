//
//  WJCommentViewController.m
//  百思不得姐
//
//  Created by wangju on 16/4/5.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJCommentViewController.h"
#import "WJTopicCell.h"
#import "WJTopic.h"
#import <MJRefresh.h>

@interface WJCommentViewController ()<UIScrollViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttomConstraint;
@property (weak, nonatomic) IBOutlet UITableView *tabbleView;

@end

@implementation WJCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化
    [self setupBasic];
    //设置tabbleHeaderView
    [self setupTableHeaderView];
    //设置刷新控件
    [self setupRefresh];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupBasic
{
    self.title = @"评论";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"comment_nav_item_share_icon" highImage:@"comment_nav_item_share_icon_click" target:nil action:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardChangedFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    self.tabbleView.backgroundColor = WJGlobalBGColor;
}

- (void)setupTableHeaderView
{
    UIView *header = [[UIView alloc] init];
//    header.backgroundColor = [UIColor redColor];
    
    WJTopicCell *topicCell = [WJTopicCell topicCell];

    [header addSubview:topicCell];

    
    topicCell.topic = self.topic;
    
    CGFloat cellW = screenSize.width;
    CGFloat cellH = self.topic.rowHeight;
    
    topicCell.size = CGSizeMake(cellW, cellH);
    
    header.height = self.topic.rowHeight;
    
    self.tabbleView.tableHeaderView = header;
    

}

- (void)setupRefresh
{
    self.tabbleView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewComments)];

    [self.tabbleView.mj_header beginRefreshing];

}

- (void)loadNewComments
{
    WJLogFunc;

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

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 13;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * const ID = @"cmt_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = @"测试";

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) return @"热门评论";
    return @"评论";
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];

}

@end
