//
//  NavgationBarView.m
//  项目三
//
//  Created by Macx on 15/11/15.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "NavgationBarView.h"
#import "BackViewController.h"

#import "CouponTableViewController.h"

#import "BackView.h"

#import "ScanViewController.h"


@implementation NavgationBarView
{
    UIView *_bgView;
    BackView *_backView;
    UIButton *_scanBtn;
    UIButton *_searchBtn;
    UIView *_newBarView;
    
    UIButton *_backBtn;
    
    UIImageView *_searchImageV;
    
    
//    AVCaptureDevice *_device;
//    AVCaptureDeviceInput *_input;
//    AVCaptureMetadataOutput *_output;
//    AVCaptureSession *_session;
//    AVCaptureVideoPreviewLayer *_preview;
    
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor colorWithRed:30/255.f green:120/255.f blue:115/255.f alpha:1];
        
        [self creatSubViews];
        

    }
    
    return self;
}

- (void)backAction{
    

    
    _mySuperView.hidden = NO;
    
    
    _backView.topsearchView.searchTableView.hidden = YES;
    
    
    UINavigationController *nav = (BaseNavigationController *)self.viewController;



    UIViewAnimationTransition transition = UIViewAnimationTransitionFlipFromRight;
    

    
    [UIView animateWithDuration:.5 animations:^{
        
        [UIView setAnimationTransition:transition forView:nav.view cache:NO];


    }];
    
    
    for (UIView *view in _mySuperView.subviews) {
        
        view.hidden = NO;
        
    }

    _backView.hidden = YES;
    [_searchTextField resignFirstResponder];
    
    
    CGRect frame = _bgView.frame;
    frame.size.width = frame.size.width + 40;
    frame.origin.x = frame.origin.x - 40;
    _bgView.frame = frame;
    
    _searchBtn.hidden = YES;
    [_searchBtn removeFromSuperview];
    
   
        _scanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _scanBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        _scanBtn.frame = CGRectMake(_newBarView.frame.size.width - 45, 3, 34, 34);
        [_scanBtn setTitle:@"扫一扫" forState:UIControlStateNormal];
        [_newBarView addSubview:_scanBtn];
        _scanBtn.hidden = NO;

        [_scanBtn addTarget:self action:@selector(scanAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)creatSubViews{
    
    if (!_newBarView) {
        
        _newBarView = [[UIView alloc]initWithFrame:self.bounds];
        [self addSubview:_newBarView];

    }
    
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    [_backBtn setBackgroundImage:[UIImage imageNamed:@"actionbar_center_white"] forState:UIControlStateNormal];
    _backBtn.frame = CGRectMake(20, 4, 34, 34);
    [_newBarView addSubview:_backBtn];
    [_backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];

    
    if (!_bgView) {
        
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(20, 5, self.frame.size.width - 80, 30)];

    }
    [_newBarView addSubview:_bgView];
    _bgView.backgroundColor = [UIColor colorWithRed:30/255.f green:120/255.f blue:115/255.f alpha:1];
    _bgView.layer.cornerRadius = 5;
    _bgView.clipsToBounds = YES;
    
    if (!_searchImageV) {
        
        _searchImageV = [[UIImageView alloc]initWithFrame:CGRectMake(60, 10, 24, 24)];

    }
    
    _searchImageV.image = [UIImage imageNamed:@"actionbar_search_unselect"];
    [_newBarView addSubview:_searchImageV];
    
    if (!_searchTextField) {
        _searchTextField = [[UITextField alloc]initWithFrame:CGRectMake(100, 0, self.bounds.size.width - 60, self.bounds.size.height)];
    }
    _searchTextField.delegate = self;
    [_newBarView addSubview:_searchTextField];
    
    _searchTextField.layer.cornerRadius = 8;
    _searchTextField.placeholder = @"搜索你要的商家优惠券";
    _searchTextField.textColor = [UIColor whiteColor];
    [_searchTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];//修改颜色
    _searchTextField.font = [UIFont systemFontOfSize:12];
//    _searchTextField.backgroundColor = [UIColor colorWithRed:30/255.f green:120/255.f blue:115/255.f alpha:1];
    _searchTextField.clipsToBounds = YES;
    
    if (!_scanBtn) {
        _scanBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    }
    
    _scanBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    _scanBtn.frame = CGRectMake(_newBarView.frame.size.width - 45, 3, 34, 34);
    [_scanBtn setTitle:@"扫一扫" forState:UIControlStateNormal];
    [_scanBtn addTarget:self action:@selector(scanAction) forControlEvents:UIControlEventTouchUpInside];
    
    [_newBarView addSubview:_scanBtn];
    
    

    
}

- (void)scanAction{
    
    
    SYQRCodeViewController *qrcodevc = [[SYQRCodeViewController alloc] init];
    qrcodevc.SYQRCodeSuncessBlock = ^(SYQRCodeViewController *aqrvc,NSString *qrString){
//        self.saomiaoLabel.text = qrString;
        [aqrvc dismissViewControllerAnimated:NO completion:nil];
        
        ScanViewController *vc = [[ScanViewController alloc]init];
        
        vc.str = qrString;
        
        [self.superViewController.navigationController pushViewController:vc animated:YES];
    
    };
    qrcodevc.SYQRCodeFailBlock = ^(SYQRCodeViewController *aqrvc){
//        self.saomiaoLabel.text = @"fail~";
        [aqrvc dismissViewControllerAnimated:NO completion:nil];
    };
    qrcodevc.SYQRCodeCancleBlock = ^(SYQRCodeViewController *aqrvc){
        [aqrvc dismissViewControllerAnimated:NO completion:nil];
//        self.saomiaoLabel.text = @"cancle~";
    };
    
    [self.superViewController.navigationController pushViewController:qrcodevc animated:YES];

    
//    [self.viewController.navigationController presentViewController:qrcodevc animated:YES completion:nil];
    
    
    
    
}



#pragma mark UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    

    BackViewController *backVC = [[BackViewController alloc]init];
    backVC.view.backgroundColor = [UIColor redColor];
//    _superView = self.viewController.view;


    if (!_backView) {
        
        _backView = [[BackView alloc]initWithFrame:CGRectMake(0, 10, _mySuperView.frame.size.width, _mySuperView.frame.size.height)];
        _backView.backgroundColor  = [UIColor whiteColor];
        
    }
  

    
    UINavigationController *nav = (BaseNavigationController *)self.viewController;
//    CouponTableViewController *couponVC = [nav.viewControllers firstObject];
    
    
    
    UIViewAnimationTransition transition = UIViewAnimationTransitionFlipFromLeft;
    
//    UIViewAnimationTransition transition1 = UIViewAnimationTransitionFlipFromLeft;


    [UIView animateWithDuration:.5 animations:^{
       

        [UIView setAnimationTransition:transition forView:nav.view cache:YES];
        

    } completion:^(BOOL finished) {
        
        _mySuperView.hidden = NO;
        
        
        
    }] ;
    
    
    for (UIView *view in _mySuperView.subviews) {
        
        
        view.hidden = YES;
        
    }

    _backView.hidden = NO;


    [_mySuperView addSubview:_backView];
    
//    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    backBtn.backgroundColor = [UIColor redColor];
//    backBtn.frame = CGRectMake(0, 0, 44, 44);
    
    
    CGRect frame = _bgView.frame;
    frame.size.width = frame.size.width - 40;
    frame.origin.x = frame.origin.x + 40;
    _bgView.frame = frame;
    
    _scanBtn.hidden = YES;
    
    if (!_searchBtn) {
        
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    }
    _searchBtn.frame = _scanBtn.frame;
    _searchBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [_searchBtn addTarget:self action:@selector(searchAction) forControlEvents:UIControlEventTouchUpInside];
    
    [_scanBtn removeFromSuperview];
    
    [_searchBtn setTitle:@"搜索" forState:UIControlStateNormal];

    _searchBtn.hidden = NO;
    [_newBarView addSubview:_searchBtn];
    
    [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"change"];
}


- (void)change{
    
//    if (!_backView) {
//        
//        _backView = [[BackView alloc]initWithFrame:CGRectMake(0, 10, _mySuperView.frame.size.width, _mySuperView.frame.size.height)];
//        _backView.backgroundColor  = [UIColor whiteColor];
//        
//    }
    
    CGRect frame = _bgView.frame;
    frame.size.width = frame.size.width - 40;
    frame.origin.x = frame.origin.x + 40;
    _bgView.frame = frame;
    
    _scanBtn.hidden = YES;
    
    if (!_searchBtn) {
        
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
    }
    _searchBtn.frame = _scanBtn.frame;
    _searchBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [_searchBtn addTarget:self action:@selector(searchAction) forControlEvents:UIControlEventTouchUpInside];
    
    [_scanBtn removeFromSuperview];
    
    [_searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    
    [_newBarView addSubview:_searchBtn];
    
    _backView.hidden = YES;
    
}

- (void)searchAction{
    
    
    
    
}


@end
