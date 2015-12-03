//
//  RushTableView.h
//  项目三
//
//  Created by Macx on 15/11/23.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RushTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,copy)NSArray *dataList;

@end
