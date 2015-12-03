//
//  TabBarItem.m
//  ptoject1
//
//  Created by Mac on 15/7/17.
//  Copyright (c) 2015年 BV-3G. All rights reserved.
//

#import "TabBarItem.h"

@implementation TabBarItem
{
    
    UIImageView *imageView;
    UILabel *label;

}

-(void)setSelectedImage:(NSString *)selectedImage{
    _selectedImage = selectedImage;
    
    imageView.image = [UIImage imageNamed:self.selectedImage];

}


- (void)setTitleColor:(UIColor *)titleColor{
    
    _titleColor = titleColor;
    
    label.textColor = _titleColor;
    
}

-(id)initWithFrame:(CGRect)frame withTabBarItem:(UITabBarItem *)item{

    
    if (self = [super initWithFrame:frame]) {
        
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width/2-10, 10, 20, 20)];
        imageView.image = item.image;
        
        
        
        //禁止图片拉伸
//        imageView.contentMode = UIViewContentModeCenter;
        
        [self addSubview:imageView];
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 37, frame.size.width, 10)];
        
        label.text = item.title;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:9];
        [self addSubview:label];
        
        
    }


    return self;
}


@end
