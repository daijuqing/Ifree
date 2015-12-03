//
//  WebViewController.h
//  项目三
//
//  Created by Macx on 15/11/26.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailModel.h"


@interface WebViewController : UIViewController<UIWebViewDelegate>

@property (nonatomic ,copy)DetailModel *model;

@end
