//
//  DateFomatter.h
//  Project2
//
//  Created by Mac on 15/10/19.
//  Copyright (c) 2015年 BV-3G. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateFomatter : NSObject


/**
 *  方法说明：将时间字符串转换成时间（NSDate）
 *
 *  @param   matter：时间字符串旧有的格式
 *           dateString：原始的时间字符
 *
 *  @return  NSDate
 */
+ (NSDate *)getDateForDateFormatter:(NSString *)matter from:(NSString *)dateString;



/**
 *  方法说明：将时间（NSDate） 转换成 时间字符串 NSString
 *
 *  @param  matter：需要的时间字符串的格式
 *          date：被转换的时间
 *
 *  @return 需要的时间字符串
 */
+ (NSString *)getDateStringForDateFormatter:(NSString *)matter from:(NSDate *)date;


/**
 *  方法说明：时间字符串 --> 需要格式的字符串
 *
 *  @param  newFormatter：需要的时间字符串的格式
 *          dateString：被转换的时间字符串（获取到的原始数据）
 *          oldFormatter：dateString的时间格式
 *
 *  @return 需要格式的字符串
 */
+ (NSString *)getDateStringForDateFormatter:(NSString *)newFormatter
                             fromDateString:(NSString *)dateString
                       withOldDateFormatter:(NSString *)oldFormatter;

+ (NSString *)getCurrentDateStringForDateFormatter:(NSString *)newFormatter
                                    fromDateString:(NSString *)dateString
                              withOldDateFormatter:(NSString *)oldFormatter;

@end
