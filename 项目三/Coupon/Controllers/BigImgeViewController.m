//
//  BigImgeViewController.m
//  项目三
//
//  Created by Macx on 15/11/23.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "BigImgeViewController.h"

@interface BigImgeViewController ()
{
    UIButton *_btn;
    UIImageView *_imageV;
    UIActivityIndicatorView *juhua;
}

@end

@implementation BigImgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.view.backgroundColor = [UIColor blackColor];
    

}

- (void)creatSubViews{
    
    _imageV = [[UIImageView alloc]initWithFrame:self.view.bounds];
    _imageV.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.view addSubview:_imageV];
    
    CGFloat WH = 60;
    
    juhua = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    juhua.frame = CGRectMake((self.view.width - WH)/2, (self.view.height - WH)/2, WH, WH);
    juhua.color = [UIColor whiteColor];
    [juhua startAnimating];
    [self.view addSubview:juhua];
    
    
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.backgroundColor = [UIColor clearColor];
    [_btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    _btn.frame = self.view.bounds;
    [self.view addSubview:_btn];
    
}

- (void)btnAction{
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
}
- (void)setModel:(SellerPriceModel *)model{
    
    _model = model;
    
    [self creatSubViews];
    
    [_imageV sd_setImageWithURL:[NSURL URLWithString:_model.show_pic]];
//    [_imageV sd_setImageWithURL:[NSURL URLWithString:_model.show_pic] placeholderImage:[UIImage imageNamed:@"jiazai.gif"]];

    [_imageV sd_setImageWithURL:[NSURL URLWithString:_model.show_pic] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       
        if (image) {
            
            [juhua stopAnimating];
            
        }
        
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
