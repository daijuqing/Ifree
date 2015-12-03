//
//  BannerView.m
//  项目三
//
//  Created by Macx on 15/11/13.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#define kLableH 30

#import "BannerView.h"

#import "BannerModel.h"

#import "DetailModel.h"

#import "ActivityViewController.h"

#import "WebViewController.h"

@implementation BannerView
{
    UIImageView *_leftImageView;
    UIImageView *_rightUpImageView;
    UIImageView *_rightDownImageView;
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self creatSubViews];
        
    }
    
    return self;
    
}

- (void)creatSubViews{
    
    [self creatTitle];
    
    [self creatLeftView];
    
    [self creatRightView];
    
    
}
- (void)creatTitle{
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, kLableH)];
    label.backgroundColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:15];
//    label.layer.borderColor = [[UIColor grayColor] CGColor];
//    label.layer.borderWidth = 2;
    [self addSubview:label];
    label.text = @"     精品推荐";
    
    UIView *border = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 5, kLableH)];
    border.backgroundColor = [UIColor colorWithRed:0 green:200/255.f blue:233/255.f alpha:1];
    [self addSubview:border];
    
    
//    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 5, self.frame.size.width, 5)];
//    imageV.backgroundColor = [UIColor redColor];
//    imageV.image = [UIImage imageNamed:@"line_cell"];
//    [label addSubview:imageV];
}

- (void)creatRightView{
    
    UIButton *rightUpBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
    rightUpBtn.tag = 1301;
    [rightUpBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    rightUpBtn.frame = CGRectMake(self.frame.size.width/2, kLableH + 1, self.frame.size.width/2 -30 + kLableH, (self.frame.size.height - kLableH)/2);
    [self addSubview:rightUpBtn];
    _rightUpImageView = [[UIImageView alloc]initWithFrame:rightUpBtn.frame];
    [self addSubview:_rightUpImageView];
    
    
    
    UIButton *rightDownBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
    rightDownBtn.tag = 1302;
    [rightDownBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    rightDownBtn.frame = CGRectMake(self.frame.size.width/2, (self.frame.size.height - kLableH)/2 +0.5 + kLableH + 1, self.frame.size.width/2, (self.frame.size.height - kLableH)/2 - 0.5);
    [self addSubview:rightDownBtn];
    _rightDownImageView = [[UIImageView alloc]initWithFrame:rightDownBtn.frame];
    [self addSubview:_rightDownImageView];
    
}

- (void)creatLeftView{
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.tag = 1300;
     [leftBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.frame = CGRectMake(0, kLableH + 1, self.frame.size.width / 2 - 0.5, self.frame.size.height - kLableH );
    
    _leftImageView = [[UIImageView alloc]initWithFrame:leftBtn.frame
                                  ];
    [self addSubview:_leftImageView];
    [self addSubview:leftBtn];
 
}

- (void)setDataList:(NSArray *)dataList {
    
    _dataList = dataList;
    
    DetailModel *model = [_dataList objectAtIndex:0];
    [_leftImageView sd_setImageWithURL:[NSURL URLWithString:model.pic]];

    DetailModel *model1 = [_dataList objectAtIndex:1];
    [_rightUpImageView sd_setImageWithURL:[NSURL URLWithString:model1.pic]];
    
    DetailModel *model2 = [_dataList objectAtIndex:2];
    [_rightDownImageView sd_setImageWithURL:[NSURL URLWithString:model2.pic]];
    
}


- (void)btnAction:(UIButton *)btn{
    
    DetailModel *model = [_dataList objectAtIndex:(btn.tag-1300)];
    
    if ([model.activity_id intValue] != 0) {
        
        ActivityViewController *vc = [[ActivityViewController alloc]init];
        vc.detailModel = model;
        vc.navigationController.title = @"活动详情";
        [self.viewController.navigationController pushViewController:vc animated:YES];
        
        
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"change"];

        return;
        
    }else{
        
        WebViewController *vc = [[WebViewController alloc]init];
        vc.model = model;
        
        [self.viewController.navigationController pushViewController:vc animated:YES];
        
    }
    
}


@end
