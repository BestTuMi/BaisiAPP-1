//
//  WJRecommendController.m
//  百思不得姐
//
//  Created by wangju on 16/3/13.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJRecommendController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import <MJRefresh.h>
#import "WJRecommondCategory.h"
#import "WJCategoryTableViewCell.h"
#import "WJRecommondUser.h"
#import "WJRecommondUserCell.h"

#define WJSelecterCategory self.list[self.categorys.indexPathForSelectedRow.row]

@interface WJRecommendController ()<UITableViewDelegate,UITableViewDataSource>

/*左边的类别数据*/
@property (nonatomic,strong) NSArray *list;

@property (weak, nonatomic) IBOutlet UITableView *categorys;
@property (weak, nonatomic) IBOutlet UITableView *userInfos;

/*请求参数*/
@property (nonatomic,strong) NSMutableDictionary *params;

/*AFN的请求管理者*/
@property (nonatomic,strong) AFHTTPSessionManager *manager;

@end

static NSString * const categoryID = @"Category";
static NSString * const userID = @"user";

@implementation WJRecommendController


- (AFHTTPSessionManager *)manager
{
    if (_manager == nil) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"推荐关注";
    self.view.backgroundColor = WJGlobalBGColor;
    
    //初始化tableView
    [self setupTableView];
    
    //添加刷新控件
    [self setupRefresh];
    
    [self loadCategorys];
    
}

- (void)loadCategorys
{
    [SVProgressHUD showWithStatus:@"努力加载中..." maskType:SVProgressHUDMaskTypeClear];
    
    NSMutableDictionary *params =[NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    
    [self.manager GET:BSURL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        
        self.list = [WJRecommondCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.categorys reloadData];
        [self.categorys selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        [self.userInfos.mj_header beginRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [SVProgressHUD showErrorWithStatus:@"网络请求失败"];
        
    }];

}

- (void)setupTableView
{
    [self.categorys registerNib:[UINib nibWithNibName:NSStringFromClass([WJCategoryTableViewCell class]) bundle:nil] forCellReuseIdentifier:categoryID];
    [self.userInfos registerNib:[UINib nibWithNibName:NSStringFromClass([WJRecommondUserCell class]) bundle:nil] forCellReuseIdentifier:userID];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.categorys.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.userInfos.contentInset = self.categorys.contentInset;
    
    self.categorys.rowHeight = 45;
    self.userInfos.rowHeight = 60;
}

/**
 *  添加刷新控件
 */
- (void)setupRefresh
{
    self.userInfos.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
    self.userInfos.mj_footer.hidden = YES;
    
    self.userInfos.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUsers)];
    
}

/**
 *  判断底部刷新控件的状态
 */
- (void)checkFooterState
{
    WJRecommondCategory *category = WJSelecterCategory;
    if (category.next_page > category.total_page) {
        [self.userInfos.mj_footer endRefreshingWithNoMoreData];
    }
    else
    {
        [self.userInfos.mj_footer endRefreshing];
    }

}

/**
 *  加载新的用户数据
 */
-(void)loadNewUsers
{
    WJRecommondCategory *category = WJSelecterCategory;
    [category.users removeAllObjects];
    category.next_page = 1;;
    [self loadMoreUsers];
}

/**
 *  加载更多数据
 */
-(void)loadMoreUsers
{
    WJRecommondCategory *category = WJSelecterCategory;
    
    WJLog(@"%s",__func__);
    NSMutableDictionary *params =[NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(category.id);
    params[@"page"] = @(category.next_page);
    
    self.params = params;

    [self.manager GET:BSURL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        WJLog(@"%@",responseObject);
        
        NSArray *users = [WJRecommondUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        category.next_page = [responseObject[@"next_page"] integerValue];
        category.total_page = [responseObject[@"total_page"] integerValue];
        
        [category.users addObjectsFromArray:users];
        
        if (self.params != params) return;
        
        
        [self.userInfos reloadData];
        [self checkFooterState];
        [self.userInfos.mj_header endRefreshing];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [SVProgressHUD showErrorWithStatus:@"网络请求失败"];
        [self.userInfos.mj_header endRefreshing];
        
    }];
    
}

#pragma mark - tableView的代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.categorys) {
        return self.list.count;
    }
    WJRecommondCategory *category = WJSelecterCategory;
    
    self.userInfos.mj_footer.hidden = (category.users.count == 0||category.next_page > category.total_page);
    
    return category.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categorys) {
        WJRecommondCategory *category = self.list[indexPath.row];
        WJCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:categoryID];
        
        cell.category = category;
        return cell;
    }
    else
    {
        WJRecommondCategory *category = WJSelecterCategory;

        WJRecommondUser *user = category.users[indexPath.row];
        WJRecommondUserCell *cell = [tableView dequeueReusableCellWithIdentifier:userID];
 
        cell.user = user;
            
        return cell;
    }
 
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //结束刷新
    [self.userInfos.mj_header endRefreshing];
    [self.userInfos.mj_footer endRefreshing];
    
    if (tableView == self.userInfos) return;
    
    WJRecommondCategory *category = self.list[indexPath.row];

    
    if (category.users.count) {//有曾经的数据
        [self.userInfos reloadData];
    }
    else
    {
        // 赶紧刷新表格,马上显示当前category的用户数据,
        //不让用户看见上一个category的残留数据
        //不处理会异常崩溃
        [self.userInfos reloadData];
        
        [self.userInfos.mj_header beginRefreshing];
        
        [self checkFooterState];
    }

}

- (void)dealloc
{
    WJLogFunc;
    //停止所有的操作
    [self.manager.operationQueue cancelAllOperations];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
