//
//  DetialTableViewController1.h
//  项目三
//
//  Created by Macx on 15/11/23.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetialTableViewController1 : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,assign)NSInteger index;
@property (nonatomic ,copy)NSMutableArray *dataList;

@end
