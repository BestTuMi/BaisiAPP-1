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
#import "WJRecommondCategory.h"
#import "WJCategoryTableViewCell.h"


@interface WJRecommendController ()<UITableViewDelegate,UITableViewDataSource>

/*左边的类别数据*/
@property (nonatomic,strong) NSArray *list;

@property (weak, nonatomic) IBOutlet UITableView *categorys;
@property (weak, nonatomic) IBOutlet UITableView *userInfos;



@end

static NSString * const categoryID = @"Category";

@implementation WJRecommendController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"推荐关注";
    self.view.backgroundColor = WJGlobalBGColor;
    
    
    [self.categorys registerNib:[UINib nibWithNibName:NSStringFromClass([WJCategoryTableViewCell class]) bundle:nil] forCellReuseIdentifier:categoryID];
    
    self.categorys.rowHeight = 45;
    
    
    [SVProgressHUD showWithStatus:@"努力加载中..." maskType:SVProgressHUDMaskTypeClear];
    
    NSMutableDictionary *params =[NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    NSString *url = @"http://api.budejie.com/api/api_open.php";
    [[AFHTTPSessionManager manager] GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        WJLog(@"%@",responseObject);
        
        self.list = [WJRecommondCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.categorys reloadData];
        [self.categorys selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [SVProgressHUD showErrorWithStatus:@"网络请求失败"];
        
    }];
    
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.categorys) {
        return self.list.count;
    }
    
    return 20;
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
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        }
        return cell;
    }
    

    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
