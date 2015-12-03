//
//  CenterViewController.m
//  项目三
//
//  Created by Macx on 15/12/1.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "CenterViewController.h"

@interface CenterViewController ()
{
    UILabel *_label;
}

@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 60)];
    [self.view addSubview: _label];
    _label.text = @"本地缓存 0.00M";
    _label.textAlignment = NSTextAlignmentCenter;
    
    [self computer];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(0, 124, kScreenWidth, 60);
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitle:@"清理缓存" forState:UIControlStateNormal];
    [btn addTarget:self  action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnAction{
    
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"是否删除" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [alertView show];
    

    
}

- (void)computer{
    
    //1.获取缓存路径
    NSString *pathFile = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/default/com.hackemist.SDWebImageCache.default"];
    
    //2.创建文件管理者
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //3.获得缓存路径下的所有文件(存放缓存文件的文件名)
    NSArray *fileNames = [fileManager subpathsOfDirectoryAtPath:pathFile error:nil];
    
    
    long long sum = 0;
    
    //4.遍历数组  获得每一个缓存文件的大小
    for (NSString *name in fileNames) {
        
        //4.1拼出缓存文件的文件名
        NSString *cachePath = [pathFile stringByAppendingPathComponent:name];
        
        NSDictionary *dic = [fileManager attributesOfItemAtPath:cachePath error:nil];
        
        //4.2计算缓存文件的大小
        long long size = [dic fileSize];
        
        
        sum  = sum +size;
    }

    _label.text =  [NSString stringWithFormat:@"本地缓存%lldM",sum/1024/1024];
    
}

- (void)deleteFile{
    
    //1.获取缓存路径
    NSString *pathFile = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/default/com.hackemist.SDWebImageCache.default"];
    
    //2.创建文件管理者
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //3.获得缓存路径下的所有文件(存放缓存文件的文件名)
    NSArray *fileNames = [fileManager subpathsOfDirectoryAtPath:pathFile error:nil];
    
    
    //4.遍历数组  获得每一个缓存文件的大小
    for (NSString *name in fileNames) {
        
        //4.1拼出缓存文件的文件名
        NSString *cachePath = [pathFile stringByAppendingPathComponent:name];
        
        [fileManager removeItemAtPath:cachePath error:nil];
        
    }
    
    [self computer];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self computer];

    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        
        [self deleteFile];
        
    }
    
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
