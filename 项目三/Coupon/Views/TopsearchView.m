//
//  TopsearchView.m
//  项目三
//
//  Created by Macx on 15/11/17.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "TopsearchView.h"
#import "ActivityModel.h"

@implementation TopsearchView
{
    
    NSArray *_postDataList;
    NSMutableArray *_dataList;
    
}


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
     
        [self creatSubViews];
        [self loadPostDataList];
    }
    return self;
}

- (void)loadPostDataList{
    
    _postDataList = @[@"cwogIEJrXZl3b3JkIiA6IELlpJbljXYiLAogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogIjY1XTU2YWYwXGU4NGJmYjk5XWFiM2FjNxFkXWViXTQ5YjXhM2C3XDCiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ3NxU3NjCxIiwKIEAiYZV0aF9ub25jXSIgOiAiMTk0MTI4IiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYWNjXZNxZ3Rva2VuIiA6IEJIXVFZVllPMxF2dGX0alprb2NFSmVNVjRLVFlnWCpDQyIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiEn0=",@"cwogIEJrXZl3b3JkIiA6IELmu7Tmu7TmiXPovaYiLAogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogImYyNmXlYjUwYjM5XDk5NGJlN2YxNmU3M2Y5MTC0NxY2NGNhNjQ0MWUiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ3NxU3NjI0IiwKIEAiYZV0aF9ub25jXSIgOiAiMTUxNjMzIiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYWNjXZNxZ3Rva2VuIiA6IEJIXVFZVllPMxF2dGX0alprb2NFSmVNVjRLVFlnWCpDQyIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiEn0=",@"cwogIEJrXZl3b3JkIiA6IELmmJ_lt7TlhYsiLAogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogIjXjMmQ2N2RjN2VjNje4M2Y3NjY5M2XmNxYwOTNmYTBiYWRjOTUyYxCiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ3NxU3NjI5IiwKIEAiYZV0aF9ub25jXSIgOiAiMTe4NjCwIiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYWNjXZNxZ3Rva2VuIiA6IEJIXVFZVllPMxF2dGX0alprb2NFSmVNVjRLVFlnWCpDQyIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiEn0=",@"cwogIEJrXZl3b3JkIiA6IELmu7Tmu7QiLAogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogIjNmXjdlMmI0XTk5NjVjODMzY2MzXTY2MjBjYWRhNxg3XTRiNDRmYWYiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ3NxU3NjM0IiwKIEAiYZV0aF9ub25jXSIgOiAiMTM3NjC5IiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYWNjXZNxZ3Rva2VuIiA6IEJIXVFZVllPMxF2dGX0alprb2NFSmVNVjRLVFlnWCpDQyIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiEn0=",@"cwogIEJrXZl3b3JkIiA6IELlpKfkvJfngrnor4QiLAogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogIjgzOTNkMTI5N2C1XWCwMmU0OTCwNjk2NmJmXGJhM2YwMmQ2NGRhN2QiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ3NxU3NjM5IiwKIEAiYZV0aF9ub25jXSIgOiAiMTe3MTY1IiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYWNjXZNxZ3Rva2VuIiA6IEJIXVFZVllPMxF2dGX0alprb2NFSmVNVjRLVFlnWCpDQyIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiEn0=",@"cwogIEJrXZl3b3JkIiA6IELnmb7luqblpJbljXYiLAogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogIjBmYjdmM2RkXGUxNWI0YmY2XmM5XmJjNDBjN2CxNxk3XTAzNxBkOWCiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ3NxU3NjQ5IiwKIEAiYZV0aF9ub25jXSIgOiAiMTAyNxUxIiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYWNjXZNxZ3Rva2VuIiA6IEJIXVFZVllPMxF2dGX0alprb2NFSmVNVjRLVFlnWCpDQyIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiEn0=",@"cwogIEJrXZl3b3JkIiA6IELllK_lk4HkvJoiLAogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogIjgyXTYzYxQ3MDRiMDQ3MGNlNTNiMDVhOWI4ODg1OGU4ODhiMGQ5XGUiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ3NxU3NjUzIiwKIEAiYZV0aF9ub25jXSIgOiAiMTC1OTI0IiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYWNjXZNxZ3Rva2VuIiA6IEJIXVFZVllPMxF2dGX0alprb2NFSmVNVjRLVFlnWCpDQyIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiEn0=",@"cwogIEJrXZl3b3JkIiA6IELnmb7luqYiLAogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogIjA5OWM3NmNlNxVjXWI2NmCyMjJhMxIwNjQ5Yjk5NjA4MWNjMjkzYmCiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ3NxU3NjU0IiwKIEAiYZV0aF9ub25jXSIgOiAiMTIzNTIxIiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYWNjXZNxZ3Rva2VuIiA6IEJIXVFZVllPMxF2dGX0alprb2NFSmVNVjRLVFlnWCpDQyIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiEn0=",@"cwogIEJrXZl3b3JkIiA6IELljY7kvY8iLAogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogImU2NGM3MjliYxFiXmFmYjY0XTXjYxQ4MDMyODXjODdjYxA2NTgyXDkiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ3NxU3NjU2IiwKIEAiYZV0aF9ub25jXSIgOiAiMTe2NDe0IiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYWNjXZNxZ3Rva2VuIiA6IEJIXVFZVllPMxF2dGX0alprb2NFSmVNVjRLVFlnWCpDQyIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiEn0=",@"cwogIEJrXZl3b3JkIiA6IEJl5a625rSBIiwKIEAiY2hhbm5lbF9jb2RlIiA6IEJBeHBTdG9yXSIsEiAgImF1dGhfe2lnbmF0dZJlIiA6IEJkNGQ4NmU1YjJhN2QwOTVkNxNjXTQxNDBhNTkwYjdkN2I3MmNlYjliIiwKIEAiYZBwZ3XlenNpb24iIDogIjCuNi4yIiwKIEAiXGV2aWNlZ3R5eGUiIDogIjIiLAogIEJhdZRoZ3RpbWVxdGFteEIgOiAiMTQ0Nxe1NxY1OEIsEiAgImF1dGhfbm9uY2UiIDogIjCwNTMxNEIsEiAgImVuY3J5eHQiIDogImJhe2U2NEIsEiAgInBhX2UiIDogIjCiLAogIEJkXZXpY2Vfe2VyaWFsIiA6IEIzRTI4OTI3MS1DOTQ5LTQ4OTQtQjJDMS1DRDJDNDVCNjBBOCItMTQ0NjYwNjY2MSIsEiAgImFjY2Vxe190b2tlbiIgOiAiSGVRV1XXTxMzdnRmdGpaa29jRUplTVY0S1RXX1hKQ0MiLAogIEJheHBfa2V5IiA6IEI1NTUzYjCwOTCzMTA0Igp9"];
}

- (void)creatSubViews{
    
    NSArray *titles = @[@"外卖",@"嘀嘀打车",@"星巴克",@"滴滴",@"大众点评",@"百度外卖",@"唯品会",@"华住",@"百度",@"电影"];
    
    for (int i = 0; i < 10; i ++) {
        CGFloat space = 10;
        CGFloat h = 30;
        CGFloat w = (self.frame.size.width - space * 2) / 2;
        CGFloat x = i % 2 * (w + space) + space;
        CGFloat y = i / 2 * (h + space);
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
        [self addSubview:view];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        label.layer.cornerRadius = 10;
        label.clipsToBounds = YES;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [NSString stringWithFormat:@"%d",i + 1];
        label.backgroundColor = [UIColor lightGrayColor];
        label.textColor = [UIColor whiteColor];
        [view addSubview:label];
        
        
        if (i == 0 || i == 1 || i == 2) {
            
            label.backgroundColor = [UIColor colorWithRed:30/255.f green:120/255.f blue:115/255.f alpha:1];
        }
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = 1500+i;
        [btn addTarget:self action:@selector(searchDetialAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(40, 0, 60, 20);
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [view addSubview:btn];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;


    }
    
}

- (void)searchDetialAction:(UIButton *)btn{
    
    _dataList = [[NSMutableArray alloc]init];
    
    
    _searchTableView = [[SearchTableView alloc]initWithFrame:self.bounds];
    [self addSubview:_searchTableView];
    
    [DNetWorkCore searchdataWithurlParmas:_postDataList[btn.tag - 1500] success:^(id response) {
        
        NSDictionary *resopseDic = response;
        
        NSDictionary *data = [resopseDic objectForKey:@"return_data"];
        NSArray *list = [data objectForKey:@"list"];
        
        for (NSDictionary *dic in list) {
            
            ActivityModel *model = [[ActivityModel alloc]initWithDictionary:dic];
            [_dataList addObject:model];

        }
      
        _searchTableView.dataList = _dataList;

    }];
//

}

@end
