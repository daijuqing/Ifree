//
//  BaseNavigationController.m
//  Weibo
//
//  Created by Macx on 15/10/13.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self loadImage];

}

//-(void)dealloc{
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
//}


- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        
//       
//        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadImage) name:kThemeChangeNotifation object:nil];
        
        
    }
    
    return self;
}

//- (void)loadImage{
//    
//    //获取当前的系统版本
//    NSString *device = [[UIDevice currentDevice] systemVersion];
//    
//    //根据系统版本航 设置不同的图片
////    NSString *imageName = @"mask_titlebar";
//    UIImage *image =  [[ThemeManager shareDefaultThemeManager]loadImage:@"mask_titlebar"];
//    if ([device floatValue] >= 7.0) {//iOS 7之后的导航栏包括了系统的状态栏，高为64，判断版本号的大小使用不同尺寸的图片
//        
//        image =  [[ThemeManager shareDefaultThemeManager]loadImage:@"mask_titlebar64"];
//    }
//
////    
////    [[UINavigationBar appearance]setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//
//    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//}



@end
