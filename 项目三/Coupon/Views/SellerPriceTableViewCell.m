//
//  SellerPriceTableViewCell.m
//  项目三
//
//  Created by Macx on 15/11/23.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "SellerPriceTableViewCell.h"

#import "DateFomatter.h"


@implementation SellerPriceTableViewCell
{
    
    UIImageView *_ImageV;
    UILabel *_titile;
    UILabel *_price;
    UILabel *_date;
    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self creatSubViews];
        
    }
    
    return  self;
    
}

- (void)setModel:(SellerPriceModel *)model{
    
    _model = model;
    
    [_ImageV sd_setImageWithURL:[NSURL URLWithString:model.pic]];
    
    _titile.text = _model.title;
    
    
    _price.text = [NSString stringWithFormat:@"￥%.2f",[_model.pri floatValue]];
    
    
//    NSString *date = [DateFomatter getDateStringForDateFormatter:@"yyyy年MM月dd日" from:_model.end_date];
//    _date.text = date;
    
//    float f = [_model.end_date floatValue];
//    
//    NSTimeInterval interval = f + 3600;
//    
//    NSDate *datee = [[NSDate alloc]initWithTimeIntervalSince1970:interval];
//    NSString *dateString = [DateFomatter getDateStringForDateFormatter:@"有效期至yyyy年MM月dd日" from:datee];
    
    _date.text = _model.end_date;
    
}

- (void)creatSubViews{
 
    _ImageV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
    [self.contentView addSubview:_ImageV];
    _ImageV.layer.cornerRadius = 8;
    _ImageV.clipsToBounds = YES;
    _ImageV.layer.borderWidth = 1;
    _ImageV.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    
    _titile = [[UILabel alloc]initWithFrame:CGRectMake(_ImageV.right + 5, 8, self.frame.size.width - _ImageV.width - 10, 40)];
    _titile.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_titile];
    _titile.numberOfLines = 2;
    
    
    _price = [[UILabel alloc]initWithFrame:CGRectMake(_titile.left, _titile.bottom + 2, _titile.width, 20)];
    [self.contentView addSubview:_price];
    _price.textColor = [UIColor colorWithRed:246/255.f green:54/255.f blue:0 alpha:1];
    
    _date = [[UILabel alloc]initWithFrame:CGRectMake(_titile.left, _price.bottom + 2, _titile.width, 20)];
    [self.contentView addSubview:_date];
    _date.font = [UIFont systemFontOfSize:13];
    _date.textColor = [UIColor colorWithRed:147/255.f green:147/255.f blue:147/255.f alpha:1];
    
    
}

@end
