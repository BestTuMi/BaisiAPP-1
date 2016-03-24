//
//  WJWordViewController.m
//  百思不得姐
//
//  Created by wangju on 16/3/20.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJWordViewController.h"
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import <MJRefresh.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import "WJTopic.h"
#import "WJTopicCell.h"


@interface WJWordViewController ()

@property (nonatomic,strong) AFHTTPSessionManager *manager;
/**加载帖子的数据*/
@property (nonatomic,strong) NSMutableArray *list;

/*加载帖子的Maxtime*/
@property (nonatomic,strong) NSString *maxtime;
@end
static NSString * cellID = @"TopicCell";
@implementation WJWordViewController

- (AFHTTPSessionManager *)manager
{
    if (_manager == nil) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;

}

- (NSMutableArray *)list
{
    if (_list == nil) {
        _list = [NSMutableArray array];
    }

    return _list;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupViewController];
    
    [self setupRefresh];
  
}

- (void)setupRefresh
{
    //顶部刷新条
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];

    //改变下拉刷新的透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    
    //底部刷新条
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];

}

- (void)loadNewTopics
{
    self.maxtime = nil;

    [self.list removeAllObjects];
    [self loadMoreTopics];

}

- (void)loadMoreTopics
{

    NSMutableDictionary *parmas = [NSMutableDictionary dictionary];
    parmas[@"a"] = @"list";
    parmas[@"c"] = @"data";
    parmas[@"maxtime"] = self.maxtime;
    parmas[@"type"] = @29;

    [self.manager GET:BSURL parameters:parmas progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        WJLog(@"%@",responseObject);

        [self.list addObjectsFromArray:[WJTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]]];
        
        self.maxtime = responseObject[@"info"][@"maxtime"];

        [self.tableView reloadData];
            
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
  
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载数据失败"];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }];
}

- (void)setupViewController
{
    
    self.view.backgroundColor = [UIColor clearColor];
    self.tableView.rowHeight = 150;
    
    CGFloat top = CGRectGetMaxY(self.navigationController.navigationBar.frame) + WJTitleViewHeight;
    CGFloat bottom = self.tabBarController.tabBar.height;

    self.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([WJTopicCell class]) bundle:nil] forCellReuseIdentifier:cellID];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.list.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    WJTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    WJTopic *topic = self.list[indexPath.row];
    cell.topic = topic;
    
    return cell;
}

@end
