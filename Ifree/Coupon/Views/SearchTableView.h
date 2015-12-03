//
//  SearchTableView.h
//  项目三
//
//  Created by Macx on 15/11/17.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic ,strong)NSArray *dataList;
@property (nonatomic ,strong)UIView *clearView;

@end
