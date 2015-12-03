//
//  TopTagTableViewCell.m
//  项目三
//
//  Created by Macx on 15/11/27.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "TopTagTableViewCell.h"
#import "TagModel.h"

@implementation TopTagTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
    }
    return self;
}

- (void)setDataList:(NSArray *)dataList{
    _dataList = dataList;
    [self creatSubViews];

}
- (void)creatSubViews{
    CGFloat space = 10;
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 80)];
    scrollView.contentSize = CGSizeMake((80+10) * _dataList.count, 80);
    [self.contentView addSubview:scrollView];
    
    int i = 0;
    for (TagModel *model in _dataList) {
        
        CGFloat w = 80;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(space + (w +space) * i, 0, w, w);
        [btn setTitle:model.title forState:UIControlStateNormal];
        [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:model.pic] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
//        UIImageView *bg = [[UIImageView alloc]initWithFrame:btn.bounds];
//        [bg sd_setImageWithURL:[NSURL URLWithString:model.pic]];
//        [scrollView addSubview:bg];
        
        [scrollView addSubview:btn];
        
        i ++;
    }
}

- (void)btnAction{
    
    NSLog(@"翻转");
    
}

@end
