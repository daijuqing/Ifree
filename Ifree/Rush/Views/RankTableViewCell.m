//
//  RankTableViewCell.m
//  项目三
//
//  Created by Macx on 15/11/26.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "RankTableViewCell.h"

@implementation RankTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(RankModel *)model{
    
    _model = model;
    
    [self creatSubViews];
    
}

// 187 5427 6128

- (void)creatSubViews{
    
    UILabel *paiming = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 30, 30)];
    paiming.backgroundColor = [UIColor colorWithRed:153/255.f green:153/255.f blue:153/255.f alpha:1];
    paiming.textAlignment = NSTextAlignmentCenter;
    paiming.textColor = [UIColor whiteColor];
    paiming.text = [NSString stringWithFormat:@"%@",_model.rank];
    [self.contentView addSubview:paiming];
    
    
    UILabel *chakan = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth - 60, 0, 40, 30)];
    chakan.text = [NSString stringWithFormat:@"%@",_model.viewnum];
    chakan.textAlignment = NSTextAlignmentRight;
    chakan.textColor = [UIColor colorWithRed:54/255.f green:54/255.f blue:54/255.f alpha:1];
    [self.contentView addSubview:chakan];
    
    UILabel *nikeName = [[UILabel alloc]initWithFrame:CGRectMake(paiming.right, 0, chakan.left - paiming.right, 30)];
    [self.contentView addSubview:nikeName];
    nikeName.text = _model.nickname;
    nikeName.textAlignment = NSTextAlignmentCenter;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
    }
    return self;
}

@end
