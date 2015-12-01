//
//  ActivityView.m
//  项目三
//
//  Created by Macx on 15/11/15.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "ActivityView.h"
#import "MerchantViewController.h"

@implementation ActivityView
{
    UIWebView *_webView;
    UIView *_headerView;
    
    UIScrollView *_superScrollView;
    UIView *cleatView;
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor lightGrayColor];
    }
    
    return  self;
}

- (void)setDetailModel:(DetailModel *)detailModel{
    
    _detailModel = detailModel;
    
    [self creatHeaderView];

    [self creatWebView];

    
}


- (void)creatHeaderView{
    
    //整个头视图
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 330)];
    
    //头部大图
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 220)];
    [imageView sd_setImageWithURL:[NSURL URLWithString:_detailModel.activityModel.show_pic]];
    [_headerView addSubview:imageView];
    
    //标题
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, imageView.frame.size.height, self.frame.size.width, 30)];
    [_headerView addSubview:titleLabel];
    titleLabel.text = [NSString stringWithFormat:@"   %@",_detailModel.activityModel.title];
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
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(10, 4, 40, 30)];
    name.text = @"  商家:";
    name.font = [UIFont systemFontOfSize:12];
    name.textAlignment = NSTextAlignmentRight;
    [btnView addSubview:name];
    
    //商家图标
    NSString *urlString = [_detailModel.activityModel.seller objectForKey:@"seller_pic"];
    if (![urlString isEqualToString:@""]) {
        UIImageView *btnImageV = [[UIImageView alloc]initWithFrame:CGRectMake(name.frame.size.width + 15, 5, 70, 25)];
        [btnView addSubview:btnImageV];
        [btnImageV sd_setImageWithURL:[NSURL URLWithString:[_detailModel.activityModel.seller objectForKey:@"seller_pic"]]];
    }else{
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(name.frame.size.width + 15, 7, 80, 25)];
        label.text = [_detailModel.activityModel.seller objectForKey:@"seller_title"];
        [btnView addSubview:label];
        label.font = [UIFont systemFontOfSize:11];
        
    }
    

    //右箭头
    UIImageView *rightImageV = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width - 30, 8, 10, 15)];
    rightImageV.image = [UIImage imageNamed:@"CategoryArrow"];
    [btnView addSubview:rightImageV];


    [_headerView addSubview:btn];

    
    
    //分享按钮
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareBtn addTarget:self action:@selector(shareBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    shareBtn.frame = CGRectMake(0, btn.frame.size.height + btn.frame.origin.y, self.frame.size.width, 30);
    
    //分享按钮整个视图
    UIView *shareView= [[UIView alloc]initWithFrame:shareBtn.frame];
//    CGRect frame = shareView.frame;
//    frame.origin.x = frame.origin.x + 10;
//    shareView.frame = frame;
    shareView.userInteractionEnabled = YES;
    shareView.backgroundColor = [UIColor whiteColor];
    [_headerView addSubview:shareView];
    
    //左部分
    UIImageView *shareImagev1 = [[UIImageView alloc]initWithFrame:CGRectMake(25, 8, 14, 14)];
    shareImagev1.image = [UIImage imageNamed:@"icon_award"];
    [shareView addSubview:shareImagev1];
    UILabel *shareL = [[UILabel alloc]initWithFrame:CGRectMake(45, 9, 80, 14)];
    shareL.font = [UIFont systemFontOfSize:10];
    shareL.text = @"分享送5金币";
    [shareView addSubview:shareL];
    
    //右部分
    UIImageView *share_nums = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width - 100, 8, 14, 14)];
    share_nums.image = [UIImage imageNamed:@"share_nums"];
    [shareView addSubview:share_nums];
    UILabel *share_numsL = [[UILabel alloc]initWithFrame:CGRectMake(share_nums.frame.size.width + share_nums.frame.origin.x + 5, 8, 60, 14)];
    share_numsL.font = [UIFont systemFontOfSize:10];
    share_numsL.text = [NSString stringWithFormat:@"%@人分享",_detailModel.activityModel.shared_nums];
    [shareView addSubview:share_numsL];
    
    
    [_headerView addSubview:shareBtn];
    _headerView.backgroundColor = [UIColor colorWithRed:234/255.f green:234/255.f blue:234/255.f alpha:1];
    
    
    //灰色线条
    UIView *one = [[UIView alloc]initWithFrame:CGRectMake(15, 285, self.frame
                                                          .size.width, 1)];
    one.backgroundColor = [UIColor colorWithRed:234/255.f green:234/255.f blue:234/255.f alpha:1];
    [_headerView addSubview:one];
    
    UIView *two = [[UIView alloc]initWithFrame:CGRectMake(15, 250, self.frame
                                                         .size.width, 1)];
    two.backgroundColor = [UIColor colorWithRed:234/255.f green:234/255.f blue:234/255.f alpha:1];
    [_headerView addSubview:two];
    
}

- (void)shareBtnAction:(UIButton *)sender{
    
    NSLog(@"分享");
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ShareSDK" ofType:@"png"];
    
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:@"分享内容"
                                       defaultContent:@"测试一下"
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"ShareSDK"
                                                  url:@"http://www.mob.com"
                                          description:@"这是一条测试信息"
                                            mediaType:SSPublishContentMediaTypeNews];
    //创建弹出菜单容器
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    //弹出分享菜单
    [ShareSDK showShareActionSheet:container
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions:nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                
                                if (state == SSResponseStateSuccess)
                                {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    NSLog(@"分享失败,错误码:%ld,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
}

- (void)btnAction{
    

    MerchantViewController *merchantVC = [[MerchantViewController alloc]init];
    UIWebView *web = [[UIWebView alloc]initWithFrame:merchantVC.view.bounds];
    
    NSURL *url;
    
    if ([[_detailModel.activityModel.seller objectForKey:@"seller_url"] isEqualToString:@""]) {
        
        NSString *urlString = [NSString stringWithFormat:@"https://www.baidu.com/s?wd=%@",[_detailModel.activityModel.seller objectForKey:@"seller_title"]];
        
        url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];

      
    }else{
        
        NSString *urlString = [_detailModel.activityModel.seller objectForKey:@"seller_url"];
        
        url = [NSURL URLWithString:urlString];
        
    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [web loadRequest:request];
    
    [merchantVC.view addSubview:web];
    
    
    [self.viewController.navigationController pushViewController:merchantVC animated:YES];
    
}


- (void)creatWebView{
    
    //网页驶入
    _webView = [[UIWebView alloc]initWithFrame:self.frame];
    
    NSString *urlString = _detailModel.activityModel.detail_url;
        
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







@end
