//
//  WebViewController.m
//  项目三
//
//  Created by Macx on 15/11/26.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "WebViewController.h"


@interface WebViewController ()
{
    
    UIActivityIndicatorView *_juhua;
    
}

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)init{
    
    if (self = [super init]) {
        
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
    
}

- (void)setModel:(DetailModel *)model{
    
    _model = model;
    
    [self creatSubViews];

    
}

- (void)creatSubViews{
    
    

    
    
    UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.bounds];
    web.delegate =self;
    
    NSURL *URL = [NSURL URLWithString:_model.h5_link];
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:URL];
    
    [web loadRequest:request];
    
    [self.view addSubview:web];
    
    _juhua = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    _juhua.frame =CGRectMake((self.view.width- 60)/2, (self.view.height - 60)/2, 60, 60);
    [self.view addSubview:_juhua];
    _juhua.color = [UIColor grayColor];
    
    [_juhua startAnimating];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
    
}

#pragma mark UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [_juhua stopAnimating];
    
}

@end
