//
//  SearchTableViewCell.m
//  项目三
//
//  Created by Macx on 15/11/17.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "SearchTableViewCell.h"

@implementation SearchTableViewCell
{
    UIImageView *_businessImageV;
    UILabel *_titleLabel;
    UIView *_taglistView;
    UILabel *_sellerName;
    
    UILabel *_view_nums;
    
}
- (void)setModel:(ActivityModel *)model{
    
    _model = model;
    
    
    NSArray *arr = _model.taglist;
    
    CGFloat countW = 0;
    
    for (UIView *view in _taglistView.subviews) {
        
        [view removeFromSuperview];
        
    }
    
    for (int i = 0; i < arr.count; i ++) {
        
        NSString *title = [arr objectAtIndex:i];
        NSLog(@"%lu",(unsigned long)title.length);
        
        long titleNum = title.length;
        
        
        CGFloat w = titleNum * 13;
        CGFloat space = 5;
        countW = countW + space *i;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(countW , 0, w, _taglistView.frame.size.height - 5)];
        label.textAlignment = NSTextAlignmentCenter;
        label.layer.cornerRadius = 3;
        label.clipsToBounds = YES;
        label.layer.borderColor = [[UIColor colorWithRed:53/255.f green:186/255.f blue:178/255.f alpha:1] CGColor];
        label.layer.borderWidth = 1;
        
        
        countW = countW + w;
        
        [_taglistView addSubview:label];
        label.backgroundColor = [UIColor whiteColor];
        label.text = title;
        label.textColor = [UIColor colorWithRed:53/255.f green:186/255.f blue:178/255.f alpha:1];
        label.font = [UIFont systemFontOfSize:11];
        
        
        
    }
    
    [_businessImageV sd_setImageWithURL:[NSURL URLWithString:_model.pic]];
    
    _titleLabel.text = _model.title;
    
    _sellerName.text = [_model.seller objectForKey:@"seller_title"];
    
    _view_nums.text = [NSString stringWithFormat:@"查看人数：%@",_model.view_nums];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        [self creatSubViews];
        
    }
    return  self;
}

- (void)creatSubViews{
    
    _businessImageV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 80)];
    _businessImageV.layer.cornerRadius = 3;
    _businessImageV.clipsToBounds = YES;
    _businessImageV.layer.borderWidth = 1;
    _businessImageV.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    [self addSubview:_businessImageV];
    
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(95, 10, self.frame.size.width - 95, 25)];
    [self addSubview:_titleLabel];
    
    _taglistView = [[UIView alloc]initWithFrame:CGRectMake(95, 40, self.frame.size.width - 95, 25)];
    [self addSubview:_taglistView];
    _taglistView.backgroundColor = [UIColor whiteColor];
    
    
    UIImageView *sellerImageV = [[UIImageView alloc]initWithFrame:CGRectMake(95, 70, 20, 20)];
    sellerImageV.image = [UIImage imageNamed:@"seller"];
    [self addSubview:sellerImageV];
    
    
    _sellerName = [[UILabel alloc]initWithFrame:CGRectMake(120, 70, 70, 20)];
    [self addSubview:_sellerName];
    _sellerName.font = [UIFont systemFontOfSize:12];
    _sellerName.textColor = [UIColor blackColor];
    
    
    _view_nums = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width - 100, 70, 100, 20)];
    _view_nums.font = [UIFont systemFontOfSize:12];
    _view_nums.textColor = [UIColor blackColor];
    
    _view_nums.text =@"查看人数：0";
    
    [self addSubview:_view_nums];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
