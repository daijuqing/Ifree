//
//  DetialTableViewController.m
//  项目三
//
//  Created by Macx on 15/11/23.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "DetialTableViewController.h"

#import "ActivityModel.h"

#import "SearchTableView.h"



@interface DetialTableViewController ()
{
    NSArray *_APIArray;
    SearchTableView *_tableView;
    
}

@end

@implementation DetialTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _tableView = [[SearchTableView alloc]init];
    _tableView.frame = self.tableView.frame;
    
    self.tableView = _tableView;
    

}

- (void)setIndex:(NSInteger)index{
    
    _index = index;
    
    [self loadAPI];
    
}


- (void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
    
}



- (void)loadAPI{
    
    _APIArray = @[@"http://api.allfree.cc/api14/activity/sellerShowList?ios_params=cwogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJhdZRoZ3RpbWVxdGFteEIgOiAiMTQ0ODI0MxAxNyIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiLAogIEJlbmNycZB0IiA6IEJiYZNlNjQiLAogIEJxXWzsXZJfaWQiIDogIjI4MSIsEiAgImNoYW5uXWzfY29kXSIgOiAiQZBwU3RvemUiLAogIEJhdZRoZ3NpX25hdHVyXSIgOiAiN2NmXWQ2XDAzOTe3OTI2YjFmYjNkMGQ2MmFlOTYyMWCxMDe5MWU3MEIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYZV0aF9ub25jXSIgOiAiMTA2MDM2IiwKIEAiXGV2aWNlZ3R5eGUiIDogIjIiLAogIEJhY2Nle3NfdG9rXW4iIDogIkhlUVdWWU8xMZX0XnRqWmtvY0VKXU1WNCtUWWdYSkNDIgp9",
                  @"http://api.allfree.cc/api14/activity/getlist?ios_params=cwogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogImC1XDgyYjA4OTYwNxIyY2UxODFlXTM2XjCzXTdhMxNjYxBiYmC0XmQiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ4MjQxMDY5IiwKIEAiYZV0aF9ub25jXSIgOiAiMTkxNxg2IiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAie2VsbGVyZ2lkIiA6IEIyNTCiLAogIEJhY2Nle3NfdG9rXW4iIDogIkhlUVdWWU8xMZX0XnRqWmtvY0VKXU1WNCtUWWdYSkNDIiwKIEAiYZBwZ2tlcSIgOiAiNTU1MWIzMDkzMTCwNEIKfQ%3D%3D",
                  @"http://api.allfree.cc/api14/activity/sellerShowList?ios_params=cwogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJhdZRoZ3RpbWVxdGFteEIgOiAiMTQ0ODI0MxCwNyIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiLAogIEJlbmNycZB0IiA6IEJiYZNlNjQiLAogIEJxXWzsXZJfaWQiIDogIjMwNyIsEiAgImNoYW5uXWzfY29kXSIgOiAiQZBwU3RvemUiLAogIEJhdZRoZ3NpX25hdHVyXSIgOiAiYjRmNxkzXDlkMWMyYTezOGJkXmQ3XWY3XjY5OWJmNDhjNGMzMjYzMiIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYZV0aF9ub25jXSIgOiAiMTY3MTk1IiwKIEAiXGV2aWNlZ3R5eGUiIDogIjIiLAogIEJhY2Nle3NfdG9rXW4iIDogIkhlUVdWWU8xMZX0XnRqWmtvY0VKXU1WNCtUWWdYSkNDIgp9",
                  @"http://api.allfree.cc/api14/activity/sellerShowList?ios_params=cwogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJhdZRoZ3RpbWVxdGFteEIgOiAiMTQ0ODI0MxC0MEIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiLAogIEJlbmNycZB0IiA6IEJiYZNlNjQiLAogIEJxXWzsXZJfaWQiIDogIjU3OSIsEiAgImNoYW5uXWzfY29kXSIgOiAiQZBwU3RvemUiLAogIEJhdZRoZ3NpX25hdHVyXSIgOiAiXDY1YWNhMjg0YmM2MTIyXjQ3OTY3NTAwNTkyXmXiNDk3M2NiMTkzXiIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYZV0aF9ub25jXSIgOiAiMTk0NjYxIiwKIEAiXGV2aWNlZ3R5eGUiIDogIjIiLAogIEJhY2Nle3NfdG9rXW4iIDogIkhlUVdWWU8xMZX0XnRqWmtvY0VKXU1WNCtUWWdYSkNDIgp9",
                  @"http://api.allfree.cc/api14/activity/sellerShowList?ios_params=cwogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJhdZRoZ3RpbWVxdGFteEIgOiAiMTQ0ODI0MxC4NSIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiLAogIEJlbmNycZB0IiA6IEJiYZNlNjQiLAogIEJxXWzsXZJfaWQiIDogIjI0MyIsEiAgImNoYW5uXWzfY29kXSIgOiAiQZBwU3RvemUiLAogIEJhdZRoZ3NpX25hdHVyXSIgOiAiXTlhM2Y1MxCyMGYyODAxOTexNTRiODFlNGYxODC4MGM4XjAwXTJkMyIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYZV0aF9ub25jXSIgOiAiMTI0MDM0IiwKIEAiXGV2aWNlZ3R5eGUiIDogIjIiLAogIEJhY2Nle3NfdG9rXW4iIDogIkhlUVdWWU8xMZX0XnRqWmtvY0VKXU1WNCtUWWdYSkNDIgp9",
                  @"http://api.allfree.cc/api14/activity/sellerShowList?ios_params=cwogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJhdZRoZ3RpbWVxdGFteEIgOiAiMTQ0ODI0MxIzNEIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiLAogIEJlbmNycZB0IiA6IEJiYZNlNjQiLAogIEJxXWzsXZJfaWQiIDogIjY0MEIsEiAgImNoYW5uXWzfY29kXSIgOiAiQZBwU3RvemUiLAogIEJhdZRoZ3NpX25hdHVyXSIgOiAiMDNkNWQwYxCxOTYwOWI0XmRjMTA2XjY1M2YwY2RlXDNlMDU2NWU0OSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYZV0aF9ub25jXSIgOiAiMTM0OTQ0IiwKIEAiXGV2aWNlZ3R5eGUiIDogIjIiLAogIEJhY2Nle3NfdG9rXW4iIDogIkhlUVdWWU8xMZX0XnRqWmtvY0VKXU1WNCtUWWdYSkNDIgp9",
                  @"http://api.allfree.cc/api14/activity/getlist?ios_params=cwogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogImU4MjdmNDgxXTJjNGQ0MGC0MxNjXDViXjBjOGVjXmIzMDViXjC2OTMiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ4MjQxMjQ0IiwKIEAiYZV0aF9ub25jXSIgOiAiMTM5NDgxIiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAie2VsbGVyZ2lkIiA6IEI0ODQiLAogIEJhY2Nle3NfdG9rXW4iIDogIkhlUVdWWU8xMZX0XnRqWmtvY0VKXU1WNCtUWWdYSkNDIiwKIEAiYZBwZ2tlcSIgOiAiNTU1MWIzMDkzMTCwNEIKfQ%3D%3D",
                  @"http://api.allfree.cc/api14/activity/getlist?ios_params=cwogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogIjeyNWViXTU3MjXiXje4YxBmOGCxMxNlXmY0MTIyY2I0MDI1ODJmOWUiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ4MjQxMxkzIiwKIEAiYZV0aF9ub25jXSIgOiAiMTk2Mxk5IiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAie2VsbGVyZ2lkIiA6IEIxMDgiLAogIEJhY2Nle3NfdG9rXW4iIDogIkhlUVdWWU8xMZX0XnRqWmtvY0VKXU1WNCtUWWdYSkNDIiwKIEAiYZBwZ2tlcSIgOiAiNTU1MWIzMDkzMTCwNEIKfQ%3D%3D",
                  @"http://api.allfree.cc/api14/activity/getlist?ios_params=cwogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogImY1XWM3XjYxXmQ5NDYwOWU4YTCzYjgxY2M5MxM4YxQ5MTdkMxkzYjYiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ4MjQxMxk1IiwKIEAiYZV0aF9ub25jXSIgOiAiMTg1MxY2IiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAie2VsbGVyZ2lkIiA6IEIzNTYiLAogIEJhY2Nle3NfdG9rXW4iIDogIkhlUVdWWU8xMZX0XnRqWmtvY0VKXU1WNCtUWWdYSkNDIiwKIEAiYZBwZ2tlcSIgOiAiNTU1MWIzMDkzMTCwNEIKfQ%3D%3D"];
    
    [self loadData];
    
}

- (void)loadData{
    
    [DNetWorkCore getDataWithURLstring:[_APIArray objectAtIndex:_index - 1] Withsuccess:^(id response) {
        
        id return_data = [response objectForKey:@"return_data"];
        
        NSArray *list = [return_data objectForKey:@"list"];
        
        
        NSMutableArray *models = [[NSMutableArray alloc]init];
        
        for (NSDictionary *dic in list) {
            
            ActivityModel *model = [[ActivityModel alloc]initWithDictionary:dic];
            
            [models addObject:model];
        }
        
        _tableView.dataList = models;
        
        
        [_tableView reloadData];
    }];
    
}



@end