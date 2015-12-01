//
//  DetailModel.m
//  项目三
//
//  Created by Macx on 15/11/13.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "DetailModel.h"

@implementation DetailModel

- (void)setAttributes:(NSDictionary *)dic{
    
    [super setAttributes:dic];
    
    if (self.activity.count > 0 ) {
        
        self.activityModel = [[ActivityModel alloc]initWithDictionary:self.activity];
        
    }
    
}

@end
