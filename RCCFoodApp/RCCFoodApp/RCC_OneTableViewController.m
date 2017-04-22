//
//  RCC_OneTableViewController.m
//  RCCFoodApp
//
//  Created by 任超 on 17/4/19.
//  Copyright © 2017年 任超. All rights reserved.
//

#import "RCC_OneTableViewController.h"
#import "RCC_oneCell.h"
#import "RCC_OneModel.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "MJRefresh.h"

#import "RCCHTTPRequest.h"
#import "RCCBaseRequest.h"

static NSString * const RCCURL = @"http://wthrcdn.etouch.cn/weather_mini";

@interface RCC_OneTableViewController ()

@property (strong,nonatomic) NSMutableArray *modelsArray;

@end

@implementation RCC_OneTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
    }];
    [self.tableView.mj_header beginRefreshing];
    
}

-(void)loadData{
    __weak typeof(self) weakSelf = self;

//    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
//    session.requestSerializer = [AFHTTPRequestSerializer serializer];
//    session.responseSerializer = [AFJSONResponseSerializer serializer];
//    [session GET:RCCURL parameters:@{@"city":@"西安"} progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//        NSDictionary *dic = responseObject[@"data"];
//        NSArray *array = [RCC_OneModel mj_objectArrayWithKeyValuesArray:dic[@"forecast"]];
//        _modelsArray = [NSMutableArray arrayWithArray:array];
//
//        [self.tableView reloadData];
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//    }];
    
    
    
//    [RCCHTTPRequest get:RCCURL params:@{@"city":@"西安"} seccess:^(id responseObject) {
//        NSLog(@"%@",responseObject);
//        NSDictionary *dic = responseObject[@"data"];
//        NSArray *array = [RCC_OneModel mj_objectArrayWithKeyValuesArray:dic[@"forecast"]];
//        _modelsArray = [NSMutableArray arrayWithArray:array];
//        [weakSelf.tableView reloadData];
//    } failure:^(NSError *error) {
//        NSLog(@"%@",error);
//    }];
    
    [self.tableView.mj_header beginRefreshing];
    [RCCBaseRequest getModelHUDWithURL:RCCURL param:@{@"city":@"西安"} model:nil success:^(id responseObject) {
        
        NSDictionary *dic = responseObject[@"data"];
        NSArray *array = [RCC_OneModel mj_objectArrayWithKeyValuesArray:dic[@"forecast"]];
        _modelsArray = [NSMutableArray arrayWithArray:array];
        
        [weakSelf.tableView.mj_header endRefreshing];
        [weakSelf.tableView reloadData];
    } warn:nil failure:nil tokenInvalid:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _modelsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellTableIdentifer = @"CellTableIdentifer";
    RCC_oneCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifer];
    cell = [[[NSBundle mainBundle]loadNibNamed:@"RCC_oneCell" owner:self options:nil]firstObject];

    [cell setRccModel:self.modelsArray[indexPath.row]];

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

@end
