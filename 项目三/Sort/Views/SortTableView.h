//
//  SortTableView.h
//  项目三
//
//  Created by Macx on 15/11/27.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SortTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,copy) NSMutableArray *taglist;
@property (nonatomic,copy)NSMutableArray *list1;
@property (nonatomic,copy)NSMutableArray *list2;
@property (nonatomic,copy)NSMutableArray *list3;
@property (nonatomic,copy)NSString *titile1;
@property (nonatomic,copy)NSString *titile2;
@property (nonatomic,copy)NSString *titile3;



@end
