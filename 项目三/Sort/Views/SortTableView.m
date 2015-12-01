//
//  SortTableView.m
//  项目三
//
//  Created by Macx on 15/11/27.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "SortTableView.h"

#import "SortSection.h"

#import "TopTagTableViewCell.h"

#import "SortTableViewCell.h"

@implementation SortTableView

- (void)setTitile3:(NSString *)titile3{
    
    _titile3 = titile3;
    [self reloadData];
    
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.dataSource = self;
        self.delegate = self;
        
    }
    return self;
}

#pragma mark UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        return 80;
    }
    
    return kScreenWidth;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        TopTagTableViewCell *topTag = [[TopTagTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"topTag"];
        topTag.dataList = _taglist;
        
        return topTag;
    }
    
    SortTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell = [[SortTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    if (indexPath.section == 1 &&indexPath.row == 0) {
        cell.dataList = _list1;
    }
    if (indexPath.section == 2 &&indexPath.row == 0) {
        cell.dataList = _list2;
    }
    if (indexPath.section == 3 &&indexPath.row == 0) {
        cell.dataList = _list3;
    }
    return cell;
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    SortSection *sorsection = [[SortSection alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
    if (section == 0) {
        sorsection.isBtn = NO;
        sorsection.titile = @"热门标签";
    }
    if (section == 1) {
        sorsection.isBtn = NO;
        sorsection.titile = _titile1;
    }
    if (section == 2) {
        sorsection.isBtn = YES;
        sorsection.list = _list2;
        sorsection.titile = _titile2;
    }
    if (section == 3) {
        sorsection.isBtn = YES;
        sorsection.list = _list3;
        sorsection.titile = _titile3;
    }
    
    return sorsection;
}

@end
