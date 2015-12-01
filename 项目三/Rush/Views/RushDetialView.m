//
//  RushDetialView.m
//  项目三
//
//  Created by Macx on 15/11/24.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "RushDetialView.h"
#import "MerchantViewController.h"
#import "RankViewController.h"

@implementation RushDetialView
{
    UIWebView *_webView;
    UIView *_headerView;
    
    UIScrollView *_superScrollView;
    UIView *cleatView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        
        
    }
    return self;
}

- (void)setModel:(RushModel *)model{
    
    _model = model;
    
    [self creatHeaderView];
    
    [self creatWebView];
    
}

- (void)creatWebView{
    
    //网页驶入
    _webView = [[UIWebView alloc]initWithFrame:self.frame];
    
    NSString *urlString = _model.detail_url;
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [_webView loadRequest:request];
    
    [self addSubview:_webView];
    
    //    _headerView = [[UIView alloc]init];
    
    
    //获取webView上面，scrollview的webBrowserView视图
    UIView *webBrowserView = [_webView.scrollView.subviews firstObject];
    //改变坐标
    CGRect frame = webBrowserView.frame;
    frame.origin.y = _headerView.frame.size.height + 10;
    webBrowserView.frame = frame;
    
    //将webBrowserView添加到头视图上
    [_headerView addSubview:webBrowserView];
    
    //将头视图添加会_webView.scrollView上
    [_webView.scrollView addSubview:_headerView];
    
    _webView.backgroundColor = [UIColor whiteColor];
    
    
}

- (void)creatHeaderView{
    
    //整个头视图
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 330)];
//    [self addSubview:_headerView];
    //头部大图
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 220)];
    [imageView sd_setImageWithURL:[NSURL URLWithString:_model.show_pic]];
    [_headerView addSubview:imageView];
    
    //标题
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, imageView.frame.size.height, self.frame.size.width, 30)];
    [_headerView addSubview:titleLabel];
    titleLabel.text = [NSString stringWithFormat:@"   %@",_model.title];
    titleLabel.textColor = [UIColor colorWithRed:50/255.f green:180/255.f blue:170/255.f alpha:1];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.backgroundColor = [UIColor whiteColor];
    
    
    //跳转到商家按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, titleLabel.frame.origin.y +titleLabel.frame.size.height, self.frame.size.width, 35);
    
    //按钮同一位置显示的文字图片等 全部放到btnView
    UIView *btnView = [[UIView alloc]initWithFrame:btn.frame];
    btnView.backgroundColor = [UIColor whiteColor];
    btnView.userInteractionEnabled = YES;
    [_headerView addSubview:btnView];
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(10, 4, 60, 30)];
    name.text = @"  赞助商:";
    name.font = [UIFont systemFontOfSize:12];
    name.textAlignment = NSTextAlignmentRight;
    [btnView addSubview:name];
    
    //商家图标
    NSString *urlString = [_model.seller objectForKey:@"seller_pic"];
    if (![urlString isEqualToString:@""]) {
        UIImageView *btnImageV = [[UIImageView alloc]initWithFrame:CGRectMake(name.frame.size.width + 15, 5, 70, 25)];
        [btnView addSubview:btnImageV];
        [btnImageV sd_setImageWithURL:[NSURL URLWithString:[_model.seller objectForKey:@"seller_pic"]]];
    }else{
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(name.frame.size.width + 15, 7, 80, 25)];
        label.text = [_model.seller objectForKey:@"seller_title"];
        [btnView addSubview:label];
        label.font = [UIFont systemFontOfSize:11];
        
    }
    
    
    //右箭头
    UIImageView *rightImageV = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width - 30, 8, 10, 15)];
    rightImageV.image = [UIImage imageNamed:@"CategoryArrow"];
    [btnView addSubview:rightImageV];
    
    
    [_headerView addSubview:btn];
    
    
    
//    //分享按钮
//    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [shareBtn addTarget:self action:@selector(shareBtnAction:) forControlEvents:UIControlEventTouchUpInside];
//    shareBtn.frame = CGRectMake(0, btn.frame.size.height + btn.frame.origin.y, self.frame.size.width, 30);
//    
////    //分享按钮整个视图
//    UIView *shareView= [[UIView alloc]initWithFrame:shareBtn.frame];
//    //    CGRect frame = shareView.frame;
//    //    frame.origin.x = frame.origin.x + 10;
//    //    shareView.frame = frame;
//    shareView.userInteractionEnabled = YES;
//    shareView.backgroundColor = [UIColor whiteColor];
//    [_headerView addSubview:shareView];
//    [_headerView addSubview:shareBtn];
    
    
    UIView *bottom = [[UIView alloc]initWithFrame:CGRectMake(0, btn.bottom, kScreenWidth, btn.height)];
    bottom.backgroundColor = [UIColor whiteColor];
    [_headerView addSubview:bottom];

  
    
    UILabel *totalLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 5, 60, 30)];
    [bottom addSubview:totalLabel];
    totalLabel.font = [UIFont systemFontOfSize:12];
    totalLabel.textColor = [UIColor blackColor];
    
    NSString *total_numStr = [NSString stringWithFormat:@"提供%@份",_model.total_num];
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc]initWithString:total_numStr];
    [att addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:50/255.f green:180/255.f blue:170/255.f alpha:1] range:NSMakeRange(2, 1)];
    [att addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:24] range:NSMakeRange(2, 1)];
    
    totalLabel.attributedText = att;
    
    
    
    UILabel *join_numLabel = [[UILabel alloc]initWithFrame:CGRectMake(totalLabel.right + 10, 5, 100, 30)];
    [bottom addSubview:join_numLabel];
    
    NSString *joinNum = [NSString stringWithFormat:@"%@",_model.join_num];
    NSString *joinStr = [NSString stringWithFormat:@"参与人数:%@人",joinNum];
    NSMutableAttributedString *joinAtt = [[NSMutableAttributedString alloc]initWithString:joinStr];
    [joinAtt addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(5,joinNum.length)];
    join_numLabel.font = [UIFont systemFontOfSize:12];
    join_numLabel.attributedText = joinAtt;
    
    
    UIButton *listBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    listBtn.frame = CGRectMake(bottom.right - 70, 5, 60, 25);
    [bottom addSubview:listBtn];
    [listBtn setTitle:@"中奖名单" forState:UIControlStateNormal];
    [listBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    listBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    listBtn.layer.borderColor = [[UIColor orangeColor] CGColor];
    listBtn.layer.borderWidth = 1;
    listBtn.layer.cornerRadius = 5;
    listBtn.clipsToBounds = YES;
    [listBtn addTarget:self action:@selector(listBtnAction) forControlEvents:UIControlEventTouchUpInside];
    if ([_model.join_num intValue]== 0) {
        listBtn.hidden = YES;
    }
    
    
    _headerView.backgroundColor = [UIColor colorWithRed:234/255.f green:234/255.f blue:234/255.f alpha:1];
    
    
    //灰色线条
    UIView *one = [[UIView alloc]initWithFrame:CGRectMake(15, 285, self.frame.size.width, 1)];
    one.backgroundColor = [UIColor colorWithRed:234/255.f green:234/255.f blue:234/255.f alpha:1];
    [_headerView addSubview:one];
    
    UIView *two = [[UIView alloc]initWithFrame:CGRectMake(15, 250, self.frame.size.width, 1)];
    two.backgroundColor = [UIColor colorWithRed:234/255.f green:234/255.f blue:234/255.f alpha:1];
    [_headerView addSubview:two];
    
}

- (void)listBtnAction{
    
    RankViewController *rankVC = [[RankViewController alloc]init];
    [self.viewController.navigationController pushViewController:rankVC animated:YES];
    
}

- (void)btnAction{
    
    
    MerchantViewController *merchantVC = [[MerchantViewController alloc]init];
    UIWebView *web = [[UIWebView alloc]initWithFrame:merchantVC.view.bounds];
    
    NSURL *url;
    
    if ([[_model.seller objectForKey:@"seller_url"] isEqualToString:@""]) {
        
        NSString *urlString = [NSString stringWithFormat:@"https://www.baidu.com/s?wd=%@",[_model.seller objectForKey:@"seller_title"]];
        
        url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        
    }else{
        
        NSString *urlString = [_model.seller objectForKey:@"seller_url"];
        
        url = [NSURL URLWithString:urlString];
        
    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [web loadRequest:request];
    
    [merchantVC.view addSubview:web];
    
    [self.viewController.navigationController pushViewController:merchantVC animated:YES];
    
}

@end
