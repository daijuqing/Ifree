//
//  HeaderView.h
//  项目三
//
//  Created by Macx on 15/11/13.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SegmentScrollView.h"

@interface HeaderView : UIView<UIScrollViewDelegate>

@property (nonatomic ,strong)NSArray *dataList;
@property (nonatomic ,strong)NSArray *bannerDataList;//精品推荐
@property (nonatomic ,strong)NSArray *sellerDataList;//商家推荐

+ (void)getHeaderViewHigth;

@end
