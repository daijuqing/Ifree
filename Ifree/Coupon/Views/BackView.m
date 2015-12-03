//
//  BackView.m
//  项目三
//
//  Created by Macx on 15/11/16.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "BackView.h"

@implementation BackView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self creatSubViews];
        
    }
    return self;
}


- (void)creatSubViews{
    
    _topsearchView = [[TopsearchView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    [self addSubview:_topsearchView];
    
}

@end
