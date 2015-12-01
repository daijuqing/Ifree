//
//  SellerPriceModel.m
//  项目三
//
//  Created by Macx on 15/11/23.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "SellerPriceModel.h"

#import "DateFomatter.h"

@implementation SellerPriceModel

- (void)setAttributes:(NSDictionary *)dic {

    
    self.map = @{@"price":@"setPri:"};
    
    [super setAttributes:dic];
    
    
    
        float f = [_end_date floatValue];
    
        NSTimeInterval interval = f + 3600;
    
        NSDate *datee = [[NSDate alloc]initWithTimeIntervalSince1970:interval];
        NSString *dateString = [DateFomatter getDateStringForDateFormatter:@"有效期至yyyy年MM月dd日" from:datee];
    
        self.end_date = dateString;
    

}



@end
