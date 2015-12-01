//
//  RushViewController.m
//  项目三
//
//  Created by Macx on 15/11/23.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "RushViewController.h"

#import "SegmentView.h"


#import "RushTableView.h"

#import "RushModel.h"

@interface RushViewController ()
{
    NSMutableArray *_dataLists;
}

@end

@implementation RushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.userInteractionEnabled = YES;
    
    _dataLists = [[NSMutableArray alloc]init];
    
    [self loadData];
    
}

- (void)loadData{
    
    
    NSMutableArray *dataList1 = [[NSMutableArray alloc]init];
    [DNetWorkCore getDataWithURLstring:@"http://api.allfree.cc/api14/activity/flashsalelist?ios_params=cwogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogImQxM2XhMxI0XTQ3OGQ5MmCyXmIzYjkxNDC3MDY1OGFhNDA5NmY3XjMiLAogIEJyXWFkcSIgOiAiMEIsEiAgImFweF92XZJxaW9uIiA6IEIzLjYuMiIsEiAgImRldmljXV90cZBlIiA6IEIyIiwKIEAiYZV0aF90aW1le3RhbZAiIDogIjC0NDgxMjUzNjMiLAogIEJhdZRoZ25vbmNlIiA6IEIzOTAwMTeiLAogIEJlbmNycZB0IiA6IEJiYZNlNjQiLAogIEJwYWdlIiA6IEIzIiwKIEAiXGV2aWNlZ3NlemlhbEIgOiAiMUUyODkyNxCtQxk0OS00ODk0LUIyQxCtQ0QyQxQ1RDYwQThELTC0NDY2MDY2NjCiLAogIEJhY2Nle3NfdG9rXW4iIDogIkhlUVdWWU8xMZX0XnRqWmtvY0VKXU1WNCtUWWdYSkNDIiwKIEAiYZBwZ2tlcSIgOiAiNTU1MWIzMDkzMTCwNEIKfQ%3D%3D" Withsuccess:^(id response) {
        
        id return_data = [response objectForKey:@"return_data"];
        
        id list = [return_data objectForKey:@"list"];
        
        for (NSDictionary *dic in list) {
            
            RushModel *model = [[RushModel alloc]initWithDictionary:dic];
            
            [dataList1 addObject:model];
        }
        
        [_dataLists addObject:dataList1];
        
        NSMutableArray *dataList2 = [[NSMutableArray alloc]init];
        [DNetWorkCore getDataWithURLstring:@"http://api.allfree.cc/api14/activity/flashsalelist?ios_params=cwogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogIje2NDCzMxJjXmY1YWFhXGUyMTQ4OTBhMjBmMxe0XGNjMDhhXDdjNGYiLAogIEJyXWFkcSIgOiAiMSIsEiAgImFweF92XZJxaW9uIiA6IEIzLjYuMiIsEiAgImRldmljXV90cZBlIiA6IEIyIiwKIEAiYZV0aF90aW1le3RhbZAiIDogIjC0NDgxMje0OTYiLAogIEJhdZRoZ25vbmNlIiA6IEIzNjM0MTMiLAogIEJlbmNycZB0IiA6IEJiYZNlNjQiLAogIEJwYWdlIiA6IEIzIiwKIEAiXGV2aWNlZ3NlemlhbEIgOiAiMUUyODkyNxCtQxk0OS00ODk0LUIyQxCtQ0QyQxQ1RDYwQThELTC0NDY2MDY2NjCiLAogIEJhY2Nle3NfdG9rXW4iIDogIkhlUVdWWU8xMZX0XnRqWmtvY0VKXU1WNCtUWWdYSkNDIiwKIEAiYZBwZ2tlcSIgOiAiNTU1MWIzMDkzMTCwNEIKfQ%3D%3D" Withsuccess:^(id response) {
            
            id return_data = [response objectForKey:@"return_data"];
            
            id list = [return_data objectForKey:@"list"];
            
            for (NSDictionary *dic in list) {
                
                RushModel *model = [[RushModel alloc]initWithDictionary:dic];
                
                [dataList2 addObject:model];
            }
            
            [_dataLists addObject:dataList2];
            
            [self creatSubviews];
        }];
    }];
    
    

    
}

- (void)creatSubviews{
    
    SegmentView *seg = [[SegmentView alloc]initWithFrame:CGRectMake(0, 44, kScreenWidth, kScreenHieght)];
    [self.view addSubview:seg];
    
    NSArray *nameArr = @[@"正在进行",@"即将开始"];
    
    NSMutableArray *tables = [[NSMutableArray alloc]init];
    for (int i = 0 ; i < nameArr.count; i ++) {
        
        RushTableView *table = [[RushTableView alloc]initWithFrame:self.view.frame];
        table.dataList = _dataLists[i];
        
        [tables addObject:table];
    }
    seg.ScrollTablesArr = tables;
    seg.nameArr = (NSMutableArray *)nameArr;
    
    for (RushTableView *table in tables) {
        
        table.scrollEnabled = YES;
        
    }

    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = NO;
    
}


@end
