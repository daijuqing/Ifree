//
//  RushTableViewCell.m
//  项目三
//
//  Created by Macx on 15/11/24.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "RushTableViewCell.h"
#import "DateFomatter.h"

@implementation RushTableViewCell
{
    UIImageView *_imageV;
    UIActivityIndicatorView *_juhua;
    UILabel *_total_num;
    UILabel *_end_date;
    
    UILabel *_join_num;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self creatSubView];
        
    }
    return self;
}


- (void)setModel:(RushModel *)model{
    
    _model = model;
    
    [_imageV sd_setImageWithURL:[NSURL URLWithString:_model.pic] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) {
            [_juhua stopAnimating];
        }
    }];
    
    
    
    float f = [_model.end_date floatValue];
    NSTimeInterval interval = f;
    NSDate *endDate = [[NSDate alloc]initWithTimeIntervalSince1970:interval];
    NSDate *nowDate = [NSDate date];
    NSTimeInterval remaining = [endDate timeIntervalSinceDate:nowDate];
    NSInteger day = (NSInteger)remaining/60/60/24;
    NSInteger houre = (NSInteger)remaining/60/60%24;
    
    
    _total_num.text = [NSString stringWithFormat:@"份数：%ld份",(long)[_model.total_num integerValue]];
    if ([_model.finish intValue]== 0) {
        //设置attributed
        NSString *str = _total_num.text;
        _total_num.attributedText = [self getAttributedSringWithSting:str With:NSMakeRange(3, [[NSString stringWithFormat:@"%@",_model.total_num] length])];
        
        
        //设置结束时间
        NSString *dateString = [NSString stringWithFormat:@"%ld天%ld小时",(long)day,(long)houre];
        NSMutableString *endString = [[NSMutableString alloc]initWithFormat:@"距离结束:%@",dateString];

        NSAttributedString *endDateAtt = [self getAttributedSringWithSting:endString With:NSMakeRange(5, dateString.length)];
        _end_date.attributedText = endDateAtt;
        
    }else{
        _total_num.textColor = [UIColor lightGrayColor];
        
        //设置结束时间
        float f = [_model.end_date floatValue];
        NSTimeInterval interval = f;
        NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:interval];
        NSString *dateString = [DateFomatter getDateStringForDateFormatter:@"MM月dd日结束" from:date];
        _end_date.text = dateString;
        _end_date.textColor = [UIColor lightGrayColor];
    }
    
    if ([_model.join_num intValue] > 0) {
    
        _join_num.hidden = NO;
        _join_num.text = [NSString stringWithFormat:@"已有%d人抢",[_model.join_num intValue]];
    
    }


    
    NSTimeInterval startInterVal = [_model.start_date floatValue] + 60 * 60 * 8;
    NSDate *startDate = [[NSDate alloc]initWithTimeIntervalSince1970:startInterVal];
    
    
    //如果是未开始的活动，更改end的显示
    if ([[NSDate date] timeIntervalSinceDate:startDate] < 0.0) {
       
        NSString *startString = [DateFomatter getDateStringForDateFormatter:@"MM月dd日" from:startDate];
        
               NSMutableString *startStr = [[NSMutableString alloc]initWithFormat:@"开始时间:%@",startString];
        NSMutableAttributedString *startAtt = [self getAttributedSringWithSting:startStr With:NSMakeRange(5, startString.length)];
        _end_date.attributedText = startAtt;
        
    }
    
}

- (NSMutableAttributedString *)getAttributedSringWithSting:(NSString *)string With:(NSRange)rang{
    
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc]initWithString:string];
    [att addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:53/255.f green:186/255.f blue:178/255.f alpha:1] range:rang];
    return att;
}

- (void)creatSubView{
    
    self.backgroundColor = [UIColor colorWithRed:234/255.f green:234/255.f blue:234/255.f alpha:1];
    
    _imageV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth - 20,150)];
    [self.contentView addSubview:_imageV];
    _imageV.backgroundColor = [UIColor blackColor];
    _imageV.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    _imageV.layer.borderWidth = 1;
    
    _juhua = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    _juhua.frame = CGRectMake((_imageV.width - 60)/2, (_imageV.height - 60)/2, 60, 60);
    [self.contentView addSubview:_juhua];
    [_juhua startAnimating];
    
    
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(_imageV.left, _imageV.bottom - 1, _imageV.width, 40)];
    bottomView.layer.borderWidth = 1;
    bottomView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    [self.contentView addSubview:bottomView];
    bottomView.backgroundColor = [UIColor whiteColor];
    
    _total_num = [[UILabel alloc]initWithFrame:CGRectMake(_imageV.left, 0,bottomView.width/2, 40)];
    _total_num.font = [UIFont systemFontOfSize:16];
    [bottomView addSubview:_total_num];
    
    
    _end_date = [[UILabel alloc]initWithFrame:CGRectMake(bottomView.width/2, 0, bottomView.width/2, 40)];
    _end_date.font = [UIFont systemFontOfSize:16];
    _end_date.textAlignment = NSTextAlignmentCenter;
    _end_date.right = bottomView.right;
    [bottomView addSubview:_end_date];
    
    
        
    _join_num = [[UILabel alloc]initWithFrame:CGRectMake(0, _imageV.bottom - 25, 90, 25)];
    _join_num.backgroundColor = [UIColor lightGrayColor];
    _join_num.alpha = .6;
    [_imageV addSubview:_join_num];
    _join_num.font = [UIFont systemFontOfSize:14];
    _join_num.textAlignment = NSTextAlignmentCenter;
    _join_num.hidden = YES;

}


@end
