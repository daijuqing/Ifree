//
//  TabBarItem.h
//  ptoject1
//
//  Created by Mac on 15/7/17.
//  Copyright (c) 2015年 BV-3G. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarItem : UIButton

-(id)initWithFrame:(CGRect)frame withTabBarItem:(UITabBarItem *)item;

@property (nonatomic ,copy)NSString *selectedImage;
@property (nonatomic ,copy)UIColor *titleColor;

@end
