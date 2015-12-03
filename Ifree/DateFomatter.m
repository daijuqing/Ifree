//
//  DateFomatter.m
//  Project2
//
//  Created by Mac on 15/10/19.
//  Copyright (c) 2015年 BV-3G. All rights reserved.
//

#import "DateFomatter.h"

@implementation DateFomatter


/**
 *  方法说明：将时间字符串转换成时间（NSDate）
 *
 *  @param   matter：时间字符串旧有的格式
 *           dateString：原始的时间字符
 *
 *  @return  NSDate
 */
+ (NSDate *)getDateForDateFormatter:(NSString *)matter from:(NSString *)dateString {
    
    //初始化一个时间的辅助类
    NSDateFormatter *fomatter = [[NSDateFormatter alloc] init];

    //设置辅助类的时间格式
    fomatter.dateFormat = matter;

    //完成时间转换
    NSDate *date = [fomatter dateFromString:dateString];
    
    return date;
}

/**
 *  方法说明：将时间（NSDate） 转换成 时间字符串 NSString
 *
 *  @param  matter：需要的时间字符串的格式
 *          date：被转换的时间
 *
 *  @return 需要的时间字符串
 */
+ (NSString *)getDateStringForDateFormatter:(NSString *)matter from:(NSDate *)date {

    //初始换一个时间的辅助类
    NSDateFormatter *fomatter = [[NSDateFormatter alloc] init];
    
    //设置辅助类的时间格式
    fomatter.dateFormat = matter;
    
    [fomatter setTimeZone:[NSTimeZone localTimeZone]];

    NSString *dateString = [fomatter stringFromDate:date];
    
    return dateString;

}


/**
 *  方法说明：时间字符串 --> 需要格式的字符串
 *
 *  @param  newFormatter：需要的时间字符串的格式
 *          dateString：被转换的时间字符串（获取到的原始数据）
 *          oldFormatter：dateString的时间格式
 *
 *  @return
 */
+ (NSString *)getDateStringForDateFormatter:(NSString *)newFormatter
                             fromDateString:(NSString *)dateString
                       withOldDateFormatter:(NSString *)oldFormatter
{

    NSDate *date = [DateFomatter getDateForDateFormatter:oldFormatter from:dateString];
    
    NSString *newDateString = [DateFomatter getDateStringForDateFormatter:newFormatter from:date];
    
    
    return newDateString;


}


+ (NSString *)getCurrentDateStringForDateFormatter:(NSString *)newFormatter
                                    fromDateString:(NSString *)dateString
                              withOldDateFormatter:(NSString *)oldFormatter
{

    //1. 将原始的时间字符串 按照旧有的时间格式转换成NSDate
    NSDate *oldDate = [DateFomatter getDateForDateFormatter:oldFormatter from:dateString];
    
    //2. 获取微博是多长时间之前发布的
    //当前的时间   微博的发布时间

    //NSTimeInterval 时间间隔  单位为秒（s）
    NSTimeInterval distance = [[NSDate new] timeIntervalSinceDate:oldDate];
    
    if (distance < 24*60*60) {//在一天时间内发布
        
        if (distance < 60 *60) {//一小时内发布
            
            if (distance < 60) {//一分钟内发布
                
                
                return @"刚刚";
            }
            
            return [NSString stringWithFormat:@"%ld分钟前",(long)distance/60];
        }
        
        return [NSString stringWithFormat:@"%ld小时前",(long)distance/60/60];
        
    }
    
    NSString *newDateString = [DateFomatter getDateStringForDateFormatter:newFormatter from:oldDate];
    
    return newDateString;
    
}

@end
