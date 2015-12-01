//
//  HttpRequest.m
//  项目三
//
//  Created by Macx on 15/11/13.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest

+(NSString *)parmsStirngWithparms:(NSDictionary *)parms{
    NSMutableString *parmSting = [[NSMutableString alloc]init];
    
    for (NSString *key in parms) {
        
        [parmSting appendFormat:@"%@=%@",key,[parms objectForKey:key]];
        if (key != [[parms allKeys] lastObject]) {
            [parmSting appendFormat:@"%@",@"&"];
            
        }
    }
    
    return parmSting;
}


+(void)httpRequestWithURL:(NSString *)urlString
               WithParmas:(NSDictionary *)parmas
           WithHttpMethod:(NSString *)method
         WithSuccessBlock:(void(^)(id responseObj))successBlock
            WithFailBlock:(void(^)(NSHTTPURLResponse *response))failBlock{
    
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSString *parmasString =  [self parmsStirngWithparms:parmas];
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    if ([method isEqualToString:@"GET"]) {
        
        NSString *separe = url.query?@"&":@"?";
        
        NSString *fullString = [NSString stringWithFormat:@"%@%@%@",urlString,separe,parmasString];
        
        NSURL *fullUrl = [NSURL URLWithString:fullString];
        
        [request setURL:fullUrl];
    }
    
    else {
        
        [request setHTTPBody:[parmasString dataUsingEncoding:NSUTF8StringEncoding]];
        
    }
    
    
    
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        if (data) {
            
            id responseObj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            successBlock(responseObj);
            
        }else{
            
            failBlock((NSHTTPURLResponse *)connectionError);
        }
        
        
    }];
}

@end
