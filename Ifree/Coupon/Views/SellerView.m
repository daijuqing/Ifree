//
//  SellerView.m
//  项目三
//
//  Created by Macx on 15/11/13.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#define kLableH 30.0

#import "SellerModel.h"

#import "SellerView.h"

#import "SellerModel.h"

#import "ActivityViewController.h"

#import "DetialTableViewController.h"

#import "DetialTableViewController1.h"

@implementation SellerView
{
    UIScrollView *_scrollView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor lightGrayColor];
        
    }
    
    return self;
}

- (void)setDataList:(NSArray *)dataList{
    _dataList = dataList;
    [self creatTitle];
    [self creatScrollView];
    
}

- (void)creatScrollView{
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, kLableH + 1, self.frame.size.width, self.frame.size.height - kLableH)];
    [self addSubview:_scrollView];
    
    _scrollView.backgroundColor = [UIColor whiteColor];
    
    CGFloat iteamW = 120;
    CGFloat space = 16;
    _scrollView.contentSize = CGSizeMake((iteamW + space) * _dataList.count, _scrollView.frame.size.height);
   
    
    
    int i = 0;
    for (SellerModel *model in _dataList) {
        
        UIImageView *iteam = [[UIImageView alloc]initWithFrame:CGRectMake((iteamW + space) * i + space , kLableH - 0.25, 80, 40)];
        [_scrollView addSubview:iteam];
        [iteam sd_setImageWithURL:[NSURL URLWithString:model.seller_pic]];
        
//        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(iteam.right + space , _scrollView.top, 1, _scrollView.height)];
//        view.backgroundColor = [UIColor lightGrayColor];
//        [_scrollView addSubview:view];
        
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(iteam.frame.origin.x , iteam.frame.origin.y+ 40, iteam.frame.size.width , 40)];
        [_scrollView addSubview:titleLabel];
        titleLabel.text = model.seller_title;
        titleLabel.font = [UIFont systemFontOfSize:12];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        i ++;
    }

    
    for (int i = 1; i < _dataList.count + 1; i ++) {
        
        CGFloat w = _scrollView.contentSize.width / _dataList.count;
        
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(w * i, 0, 1, _scrollView.height)];
        view.backgroundColor = [UIColor lightGrayColor];
        [_scrollView addSubview:view];
        
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = 1600 + i ;
        btn.frame = CGRectMake(w * (i - 1), 0, w, _scrollView.height);
        [_scrollView addSubview:btn];
        [btn addTarget:self  action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    
}

- (void)btnAction:(UIButton *)btn{
    
    NSInteger index = btn.tag - 1600;
    

    
    SellerModel *model = [_dataList objectAtIndex:index - 1];
    
    if ([model.seller_url isEqualToString:@""]) {
    
        DetialTableViewController1 *vc = [[DetialTableViewController1 alloc]init];
        
        vc.index = index;
        
        [self.viewController.navigationController pushViewController:vc animated:YES];
        

    }else{
       
        DetialTableViewController *vc = [[DetialTableViewController alloc]init];
        
        vc.index = index;

        [self.viewController.navigationController pushViewController:vc animated:YES];
        
    }
    
    
    
}

- (void)creatTitle{
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, kLableH)];
    label.backgroundColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:15];
    [self addSubview:label];
    label.text = @"     商家推荐";
    
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 5, kLableH)];
    border.backgroundColor = [UIColor colorWithRed:80/255.f green:170/255.f blue:30/255.f alpha:1];
    [self addSubview:border];
}

@end
