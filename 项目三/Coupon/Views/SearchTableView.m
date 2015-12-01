//
//  SearchTableView.m
//  项目三
//
//  Created by Macx on 15/11/17.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "SearchTableView.h"
#import "SearchTableViewCell.h"

#import "ActivityViewController.h"
#import "DetailModel.h"


@implementation SearchTableView

- (void)setDataList:(NSArray *)dataList{
    
    _dataList = dataList;
    
    [self reloadData];
}

- (void)awakeFromNib{
    
    [super awakeFromNib];
    
    self.delegate = self;
    self.dataSource = self;
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.delegate = self;
        self.dataSource = self;
        
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"cell";
    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    
    for (UIView *view in cell.contentView.subviews) {
        
        [view removeFromSuperview];
        
    }
    
    if (!cell) {
        
        cell = [[SearchTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    
    cell.model = [_dataList objectAtIndex:indexPath.row];
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ActivityViewController *vc = [[ActivityViewController alloc]init];

    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    ActivityModel *activityModel = [_dataList objectAtIndex:indexPath.row];
    DetailModel *detailModel = [[DetailModel alloc]init];
    detailModel.activityModel = activityModel;
    
    vc.detailModel =  detailModel;
    
  
    
    NSLog(@"%@",self.viewController.navigationController);
    
//    if (self.viewController.navigationController == nil) {
//        
//        [self.viewController presentViewController:vc animated:YES completion:nil];
//        
//    }
//
      [self.viewController.navigationController pushViewController:vc animated:YES];
    
//    [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"change"];
//    [self.viewController presentViewController:nav animated:YES completion:nil];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat y = scrollView.contentOffset.y;
    
    if (y <= 0) {
        
        _clearView.hidden = NO;
        
        return;
    }
    NSLog(@"---------%f",y);
    
}

@end
