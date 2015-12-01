//
//  SortSection.m
//  项目三
//
//  Created by Macx on 15/11/27.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "SortSection.h"

#import "ListViewController.h"

@implementation SortSection

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
    }
    return self;
}

- (void)setTitile:(NSString *)titile{
    
    _titile = titile;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, (self.width - 20)/2, self.height)];
    [self addSubview:label];
    label.text = titile;
    
    if (_isBtn == YES) {
        
        UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        moreBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        [moreBtn addTarget:self action:@selector(moreAction) forControlEvents:UIControlEventTouchUpInside];
        [moreBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        moreBtn.frame = CGRectMake(self.width - 60, 0, 40, self.height);
        [self addSubview:moreBtn];
        
    }
    
}

- (void)moreAction{
    
    ListViewController *listVC = [[ListViewController alloc]init];
    listVC.dataList = _list;
    [self.viewController.navigationController pushViewController:listVC animated:YES];
    
}

@end
