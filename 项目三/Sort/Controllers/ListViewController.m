//
//  ListViewController.m
//  项目三
//
//  Created by Macx on 15/11/27.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "ListViewController.h"
#import "SearchTableView.h"

@interface ListViewController ()
{
    SearchTableView *listtableView;
}

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self creatTableview];
}

- (void)creatTableview{
   
    
}

- (void)setDataList:(NSArray *)dataList{
    _dataList = dataList;
    
    
    listtableView = [[SearchTableView alloc]initWithFrame:self.view.bounds];
    
    [self.view addSubview:listtableView];
    
    listtableView.dataList = _dataList;
}

@end
