//
//  DNetWorkCore.h
//  项目三
//
//  Created by Macx on 15/11/13.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequest.h"

@interface DNetWorkCore : NSObject


+ (void)getAppdataWithsuccess:(void(^)(id response))block;
+ (void)searchdataWithurlParmas:(NSString *)str success:(void(^)(id response))block;//查找

+ (void)getHomePageWithsuccess:(void(^)(id response))block;

+ (void)getDataWithURLstring:(NSString *)url Withsuccess:(void(^)(id response))block;

@end
