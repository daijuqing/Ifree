//
//  ListTableView.m
//  项目三
//
//  Created by Macx on 15/11/21.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "ListTableView.h"
#import "ActivityModel.h"

#import "SearchTableViewCell.h"

#import "ActivityViewController.h"
#import "DetailModel.h"

@implementation ListTableView
{
    
    NSMutableArray *_dataList;
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.delegate = self;
        self.dataSource = self;
        _dataList = [[NSMutableArray alloc]init];
        
//        CGRect frame = self.frame;
//        frame.size.height = frame.size.height - 49;
//        self.frame = frame;
        
        
        [self loadData];
        
    }
    
    return self;
}


- (void)loadData{
    
    [DNetWorkCore getHomePageWithsuccess:^(id response) {
       
        id return_data = [response objectForKey:@"return_data"];
        
        id list = [return_data objectForKey:@"list"];
        
        for (NSDictionary *dic in list) {
            
            ActivityModel *model = [[ActivityModel alloc]initWithDictionary:dic];
            
            [_dataList addObject:model];
        }
        
        [self reloadData];
    }];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat y = scrollView.contentOffset.y;
    
    if (y <= 0) {
        
        scrollView.scrollEnabled = NO;
        
    }
    
    
    NSLog(@"---listTableView Offset----    %f",y);
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell = [[SearchTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];

    cell.model = [_dataList objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    UIViewController *vc = [[UIViewController alloc]init];
    
    ActivityModel *model = [_dataList objectAtIndex:indexPath.row];
    DetailModel *detailModel = [[DetailModel alloc]init];
    detailModel.activityModel = model;
    
    ActivityViewController *activityVC = [[ActivityViewController alloc]init];
    activityVC.detailModel = detailModel;
    
    [self.viewController.navigationController pushViewController:activityVC animated:YES];
    
    //    [tableView.viewController.navigationController pushViewController:vc animated:YES];
    
    //
    //    [self presentViewController:vc animated:YES completion:nil];
    
}
@end
