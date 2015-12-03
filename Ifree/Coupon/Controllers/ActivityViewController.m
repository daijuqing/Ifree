//
//  ActivityViewController.m
//  项目三
//
//  Created by Macx on 15/11/14.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityView.h"

#import "NavgationBarView.h"

#import "ActivityModel.h"

#import "DetailModel.h"

@interface ActivityViewController ()

@end

@implementation ActivityViewController
{
    ActivityView *activityView;
}

- (instancetype)init{
    
    if (self = [super init]) {
        [self creatSubView];

        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
 
}






- (void)setDetailModel:(DetailModel *)detailModel{
    
    _detailModel = detailModel;
    
    activityView.detailModel = self.detailModel;

    
}

- (void)creatSubView{
    
    
    activityView = [[ActivityView alloc]initWithFrame:self.view.frame];
    
    activityView.userInteractionEnabled = YES;
    
    [self.view addSubview:activityView];
    
}


- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    self.tabBarController.tabBar.hidden = NO;

    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;


    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    backBtn.backgroundColor = [UIColor redColor];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(20, 4, 34, 34);
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];

   
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        
        if ([view isKindOfClass:[NavgationBarView class]]) {
         
        }
        
    }
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
    label.text = @"活动详情";
    
    self.navigationItem.titleView = label;
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareBtn addTarget:self action:@selector(shareBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"icon_share"] forState:UIControlStateNormal];
    shareBtn.frame = CGRectMake(0, 0, 26, 26);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:shareBtn];
    
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

- (void)backAction{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
