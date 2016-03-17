//
//  WJRecommandTagController.m
//  百思不得姐
//
//  Created by wangju on 16/3/17.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJRecommandTagController.h"
#import <SVProgressHUD.h>
#import <AFNetworking.h>
#import <MJExtension.h>
#import "WJRecommendTag.h"
#import "WJRecommendTagCell.h"

@interface WJRecommandTagController ()

/*AFN管理者对象*/
@property (nonatomic,strong) AFHTTPSessionManager *manager;

/*标签数据*/
@property (nonatomic,strong) NSArray *tags;

@end
/**
 *  http://api.budejie.com/api/api_open.php?a=tag_recommend&action=sub&appname=baisishequ&asid=D83DA445-62E2-46EF-A035-779FAE071FB2&c=topic&client=iphone&device=ios%20device&from=ios&jbk=0&limit=50&mac=&market=&openudid=1d3887716c043163bf3e373d51f49299b9056cad&type=0&udid=&ver=4.0
 */

static NSString * const tagID = @"reTag";
@implementation WJRecommandTagController

- (AFHTTPSessionManager *)manager
{
    if (_manager == nil) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"推荐标签";
    self.tableView.backgroundColor = WJGlobalBGColor;
    
    [SVProgressHUD showWithStatus:@"数据加载中" maskType:SVProgressHUDMaskTypeClear];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([WJRecommendTagCell class]) bundle:nil] forCellReuseIdentifier:tagID];
    
    self.tableView.rowHeight = 65;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"c"] = @"topic";
    params[@"action"] = @"sub";
    //发送请求
    [self.manager GET:BSURL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.tags = [WJRecommendTag mj_objectArrayWithKeyValuesArray:responseObject];
        
        [self.tableView reloadData];
        WJLog(@"%@",responseObject);
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"数据请求失败"];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.tags.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WJRecommendTagCell *cell = [tableView dequeueReusableCellWithIdentifier:tagID];
    
    // Configure the cell...
    cell.reTag = self.tags[indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
