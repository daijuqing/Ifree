//
//  DetialViewController.m
//  项目三
//
//  Created by Macx on 15/11/24.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "DetialViewController.h"
#import "RushDetialView.h"

@interface DetialViewController ()

@end

@implementation DetialViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
   }

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)setModel:(RushModel *)model{
    
    _model = model;
    
    RushDetialView *view = [[RushDetialView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    view.model = _model;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}




@end
