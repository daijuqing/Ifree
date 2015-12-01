//
//  RankViewController.m
//  项目三
//
//  Created by Macx on 15/11/26.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "RankViewController.h"
#import "RankTableview.h"
#import "RankModel.h"
#import "RankTableViewCell.h"

@interface RankViewController ()
{
    NSMutableArray *_dataList;
    RankTableview *_rankTableView;
    
}

@end

@implementation RankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"中奖名单";
    [self LoadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    }
- (void)LoadData{
    
    [DNetWorkCore getDataWithURLstring:@"http://api.allfree.cc/api14/activity/flashsaleRank?ios_params=cwogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogImI1NTBlMjCzM2VlXTMzN2RjXTNjM2C0YWC3MjXiYWIwNjXjNTU1MxkiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJhY3Rpdml0cV9pXEIgOiAiNjUxIiwKIEAiYZV0aF90aW1le3RhbZAiIDogIjC0NDg1MjC4MjkiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfbm9uY2UiIDogIjCwMxg1MiIsEiAgImVuY3J5eHQiIDogImJhe2U2NEIsEiAgInBhX2UiIDogIjCiLAogIEJkXZXpY2Vfe2VyaWFsIiA6IEIzRTI4OTI3MS1DOTQ5LTQ4OTQtQjJDMS1DRDJDNDVCNjBBOCItMTQ0NjYwNjY2MSIsEiAgImFjY2Vxe190b2tlbiIgOiAiSGVRV1XXTxMzdnRmdGpaa29jRUplTVY0S1RXX1hKQ0MiLAogIEJheHBfa2V5IiA6IEI1NTUzYjCwOTCzMTA0Igp9" Withsuccess:^(id response) {
       
        id return_data = [response objectForKey:@"return_data"];
        
        id rank = [return_data objectForKey:@"rank"];
        
        _dataList = [[NSMutableArray alloc]init];
        for (NSDictionary *dic in rank) {
            
            RankModel *model = [[RankModel alloc]initWithDictionary:dic];
            
            [_dataList addObject:model];
        }
        [self creatTableView];
    }];
    
}

- (void)creatTableView{
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 50)];
    [self.view addSubview:headerView];
    headerView.backgroundColor = [UIColor colorWithRed:242/255.f green:242/255.f blue:242/255.f alpha:1];
    
    UILabel *paiming = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 30, 30)];
    paiming.text = @"排名";
    paiming.font = [UIFont systemFontOfSize:15];
    [headerView addSubview:paiming];
//    paiming.backgroundColor = [UIColor colorWithRed:242/255.f green:242/255.f blue:242/255.f alpha:1];
    
    
    UILabel *nikeName = [[UILabel alloc]initWithFrame:CGRectMake((kScreenWidth - 30)/2, 10, 30, 30)];
    nikeName.text =@"昵称";
    nikeName.font = [UIFont systemFontOfSize:15];
    [headerView addSubview:nikeName];
    
    
    UILabel *chakan = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth - 60 - 20, 10, 60, 30)];
    chakan.text = @"产看人数";
    chakan.font = [UIFont systemFontOfSize:15];
    chakan.textAlignment = NSTextAlignmentRight;
    [headerView addSubview:chakan];
    
    _rankTableView = [[RankTableview alloc]initWithFrame:CGRectMake(0, headerView.height + 64, kScreenWidth, kScreenHieght - headerView.height)];
    [self.view addSubview:_rankTableView];
    
    _rankTableView.delegate = self;
    _rankTableView.dataSource =self;
    
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return _dataList.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"cell";
    RankTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    for (UIView *view in cell.contentView.subviews) {
        
        [view removeFromSuperview];
        
    }
    
    if (!cell) {
        
        cell = [[RankTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    cell.model = _dataList[indexPath.row];
    return cell;
    
}

@end
