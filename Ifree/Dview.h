//
//  Dview.h
//  分段选择
//
//  Created by Macx on 15/11/20.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Dview : UIView<UIScrollViewDelegate>

@property (nonatomic ,copy)UIScrollView *topScroll;


@property (nonatomic, retain) NSMutableArray *ScrollTablesArr;

@property (nonatomic, retain) NSMutableArray *nameArr;


@end
