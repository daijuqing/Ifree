//
//  SortViewController.m
//  项目三
//
//  Created by Macx on 15/11/27.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "SortViewController.h"

#import "SortTableView.h"

#import "ActivityModel.h"
#import "TagModel.h"

@interface SortViewController ()
{
    NSMutableArray *_taglist;
    NSMutableArray *_list1;
    NSMutableArray *_list2;
    NSMutableArray *_list3;
    NSString *_titile1;
    NSString *_titile2;
    NSString *_titile3;
    SortTableView *_sortTableView;
}

@end

@implementation SortViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    _sortTableView = [[SortTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHieght) style:UITableViewStyleGrouped];

    [self.view addSubview:_sortTableView];
    
    [self loadData];

}

- (void)loadData{
    
    [DNetWorkCore getDataWithURLstring:@"http://api.allfree.cc/api14/auth/hotTag?ios_params=cwogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJhdZRoZ3RpbWVxdGFteEIgOiAiMTQ0ODU4NDewOEIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiLAogIEJlbmNycZB0IiA6IEJiYZNlNjQiLAogIEJhdZRoZ3NpX25hdHVyXSIgOiAiNDM5XGUwMDMzMmRhXWM5XmJjYxI0MDgyXjVjOWM3NDCxMTg0M2NmXSIsEiAgImNoYW5uXWzfY29kXSIgOiAiQZBwU3RvemUiLAogIEJkXZXpY2Vfe2VyaWFsIiA6IEIzRTI4OTI3MS1DOTQ5LTQ4OTQtQjJDMS1DRDJDNDVCNjBBOCItMTQ0NjYwNjY2MSIsEiAgImF1dGhfbm9uY2UiIDogIjC0MxYyMiIsEiAgImRldmljXV90cZBlIiA6IEIyIgp9" Withsuccess:^(id response) {
       
        
        id return_data = [response objectForKey:@"return_data"];
        
        for (NSString *key in return_data) {
            
            NSLog(@"====%@",key);
            
        }
        
        _taglist = [[NSMutableArray alloc]init];
        id taglist = [return_data objectForKey:@"taglist"];//热门标签
        for (NSDictionary *dic in taglist) {
            TagModel *model = [[TagModel alloc]initWithDictionary:dic];
            [_taglist addObject:model];
        }
        
        _list1 = [[NSMutableArray alloc]init];
        id list1 = [return_data objectForKey:@"list1"];//小编推荐
        
        for (NSDictionary *dic in list1) {
            ActivityModel *model = [[ActivityModel alloc]initWithDictionary:dic];
            [_list1 addObject:model];
        }
        
        _list2 = [[NSMutableArray alloc]init];
        id list2 = [return_data objectForKey:@"list2"];//参与排行
        for (NSDictionary *dic in list2) {
            ActivityModel *model = [[ActivityModel alloc]initWithDictionary:dic];
            [_list2 addObject:model];
        }
        
        
        _list3 = [[NSMutableArray alloc]init];
        id list3 = [return_data objectForKey:@"list3"];//查看排行榜
        for (NSDictionary *dic in list3) {
            ActivityModel *model = [[ActivityModel alloc]initWithDictionary:dic];
            [_list3 addObject:model];
        }
        
        _titile1 = [return_data objectForKey:@"title1"];
        _titile2 = [return_data objectForKey:@"title2"];
        _titile3 = [return_data objectForKey:@"title3"];
        
        _sortTableView.taglist = _taglist;
        _sortTableView.list1 = _list1;
        _sortTableView.list2 = _list2;
        _sortTableView.list3 = _list3;

        
        _sortTableView.titile1 = _titile1;
        _sortTableView.titile2 = _titile2;
        _sortTableView.titile3 = _titile3;


    }];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
