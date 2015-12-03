//
//  RushTableView.m
//  项目三
//
//  Created by Macx on 15/11/23.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "RushTableView.h"
#import "RushTableViewCell.h"

#import "DetialViewController.h"

@implementation RushTableView
{
    UIView *_headerView;
    
}

- (void)setDataList:(NSArray *)dataList{
    
    _dataList = dataList;
    
    [self reloadData];
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;

        self.backgroundColor = [UIColor colorWithRed:234/255.f green:234/255.f blue:234/255.f alpha:1];

        
        [self creatSubviews];
        
    }
    
    return self;
    
}


- (void)creatSubviews{
    
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    [self addSubview:_headerView];
    _headerView.backgroundColor = [UIColor colorWithRed:234/255.f green:234/255.f blue:234/255.f alpha:1];
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 5, _headerView.height -   10)];
    line.backgroundColor = [UIColor colorWithRed:250/255.f green:0 blue:77/255.f alpha:1];
    [_headerView addSubview:line];
    
    UILabel *titile = [[UILabel alloc]initWithFrame:CGRectMake(line.right + 10, 0, kScreenWidth - line.width, line.height)];
    titile.text = @"每天10点准时上新";
    titile.font = [UIFont systemFontOfSize:16];
    [_headerView addSubview:titile];
    
    UIView *clearView = [[UIView alloc]initWithFrame:_headerView.frame];
    self.tableHeaderView = clearView;
    clearView.backgroundColor = [UIColor clearColor];
    
    
    
}

#pragma mark UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 200;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"cell";
    
    RushTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
        cell = [[RushTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    cell.model = _dataList[indexPath.row];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetialViewController *vc = [[DetialViewController alloc]init];
    vc.model = _dataList[indexPath.row];
    [self.viewController.navigationController pushViewController:vc animated:YES];
    
}

@end
