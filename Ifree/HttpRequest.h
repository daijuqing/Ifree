//
//  HttpRequest.h
//  项目三
//
//  Created by Macx on 15/11/13.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequest : NSObject


+(void)httpRequestWithURL:(NSString *)urlString
               WithParmas:(NSDictionary *)parmas
           WithHttpMethod:(NSString *)method
         WithSuccessBlock:(void(^)(id responseObj))successBlock
            WithFailBlock:(void(^)(NSHTTPURLResponse *response))failBlock;

@end
