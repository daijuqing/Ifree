//
//  SortTableViewCell.m
//  项目三
//
//  Created by Macx on 15/11/27.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "SortTableViewCell.h"
#import "ActivityModel.h"
#import "ActivityViewController.h"
#import "DetailModel.h"

@implementation SortTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDataList:(NSArray *)dataList{
    
    _dataList = dataList;
    
    CGFloat space = 20;
    CGFloat w = (kScreenWidth - space *3)/2;
    for (int i = 0; i < 4; i ++) {
        
        CGFloat x = i / 2 * (space + w);
        CGFloat y = i % 2 * (space + w);
        
        ActivityModel *model = _dataList[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = 2000 + i;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(x +space, y +space, w, w);
        [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:model.pic] forState:UIControlStateNormal];
        [self.contentView addSubview:btn];
        
    }
    
}
- (void)btnAction:(UIButton *)btn{
    
    NSLog(@"push");
    
    ActivityViewController *vc = [[ActivityViewController alloc]init];
    DetailModel *model = [[DetailModel alloc]init];
    model.activityModel = _dataList[btn.tag - 2000];
    vc.detailModel = model;
    
    [self.viewController.navigationController pushViewController:vc animated:YES];
}

@end
