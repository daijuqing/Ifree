//
//  BaseViewController.m
//  Weibo
//
//  Created by Macx on 15/10/13.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


//-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
//        [self loadbgImage];
//    }
//    return self;
//}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadbgImage) name:kThemeChangeNotifation object:nil];        
    }
    return self;
}



- (instancetype)init{
    
    if (self = [super init]) {
//         [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadbgImage) name:kThemeChangeNotifation object:nil];
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadbgImage) name:kThemeChangeNotifation object:nil];
//    [self loadbgImage];
   
    
    

}
//
//-(void)loadbgImage{
//    
//    UIImage *iamge =[[[ThemeManager shareDefaultThemeManager]loadImage:@"bg_home.jpg"] stretchableImageWithLeftCapWidth:20 topCapHeight:20];
//
//    self.view.backgroundColor = [UIColor colorWithPatternImage:iamge];
//    
//}

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
