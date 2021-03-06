//
//  DNetWorkCore.m
//  项目三
//
//  Created by Macx on 15/11/13.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "DNetWorkCore.h"

@implementation DNetWorkCore


+ (void)getAppdataWithsuccess:(void(^)(id response))block{
    
    [HttpRequest httpRequestWithURL:@"http://api.allfree.cc/api14/activity/homepage?ios_params=cwogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogIjBjOTCyY2FjMjAyOTYxOTC1NTNkNDQzXTRkNmY3YmMzMWQxXjI3MxIiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJhXF90cZBlIiA6IEIzIiwKIEAibGFxdF92aZNpdEIgOiAiMTQ0NxM3NjYzNSIsEiAgIm9yXGVyYnkiIDogIucyvumAiSIsEiAgImRldmljXV90cZBlIiA6IEIyIiwKIEAiYZV0aF90aW1le3RhbZAiIDogIjC0NDexNxgwNxkiLAogIEJhdZRoZ25vbmNlIiA6IEIzMDk1OTQiLAogIEJlbmNycZB0IiA6IEJiYZNlNjQiLAogIEJwYWdlIiA6IEIzIiwKIEAiXGV2aWNlZ3NlemlhbEIgOiAiMUUyODkyNxCtQxk0OS00ODk0LUIyQxCtQ0QyQxQ1RDYwQThELTC0NDY2MDY2NjCiLAogIEJheHBfa2V5IiA6IEI1NTUzYjCwOTCzMTA0Igp9" WithParmas:nil WithHttpMethod:@"POST" WithSuccessBlock:^(id responseObj) {
        
        block(responseObj);
        
        
    } WithFailBlock:^(NSHTTPURLResponse *response) {
        
        
    }];
 
}

+ (void)searchdataWithurlParmas:(NSString *)str success:(void(^)(id response))block{
    
    NSString *url = [NSString stringWithFormat:@"http://api.allfree.cc/api14/activity/search?ios_params=%@",str];
    
    [HttpRequest httpRequestWithURL:url WithParmas:nil WithHttpMethod:@"POST" WithSuccessBlock:^(id responseObj) {
       
        block(responseObj);
        
    } WithFailBlock:^(NSHTTPURLResponse *response) {
        
        
    }];
    
}



/*
 http://api.allfree.cc/api14/activity/search
 
 
 
    cwogIEJrXZl3b3JkIiA6IELmu7Tmu7TmiXPovaYiLAogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogImYyNmXlYjUwYjM5XDk5NGJlN2YxNmU3M2Y5MTC0NxY2NGNhNjQ0MWUiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ3NxU3NjI0IiwKIEAiYZV0aF9ub25jXSIgOiAiMTUxNjMzIiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYWNjXZNxZ3Rva2VuIiA6IEJIXVFZVllPMxF2dGX0alprb2NFSmVNVjRLVFlnWCpDQyIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiEn0=
 
 cwogIEJrXZl3b3JkIiA6IELmmJ_lt7TlhYsiLAogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogIjXjMmQ2N2RjN2VjNje4M2Y3NjY5M2XmNxYwOTNmYTBiYWRjOTUyYxCiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ3NxU3NjI5IiwKIEAiYZV0aF9ub25jXSIgOiAiMTe4NjCwIiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYWNjXZNxZ3Rva2VuIiA6IEJIXVFZVllPMxF2dGX0alprb2NFSmVNVjRLVFlnWCpDQyIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiEn0=
 
 cwogIEJrXZl3b3JkIiA6IELmu7Tmu7QiLAogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogIjNmXjdlMmI0XTk5NjVjODMzY2MzXTY2MjBjYWRhNxg3XTRiNDRmYWYiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ3NxU3NjM0IiwKIEAiYZV0aF9ub25jXSIgOiAiMTM3NjC5IiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYWNjXZNxZ3Rva2VuIiA6IEJIXVFZVllPMxF2dGX0alprb2NFSmVNVjRLVFlnWCpDQyIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiEn0=
 
 cwogIEJrXZl3b3JkIiA6IELlpKfkvJfngrnor4QiLAogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogIjgzOTNkMTI5N2C1XWCwMmU0OTCwNjk2NmJmXGJhM2YwMmQ2NGRhN2QiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ3NxU3NjM5IiwKIEAiYZV0aF9ub25jXSIgOiAiMTe3MTY1IiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYWNjXZNxZ3Rva2VuIiA6IEJIXVFZVllPMxF2dGX0alprb2NFSmVNVjRLVFlnWCpDQyIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiEn0=
 
 cwogIEJrXZl3b3JkIiA6IELnmb7luqblpJbljXYiLAogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogIjBmYjdmM2RkXGUxNWI0YmY2XmM5XmJjNDBjN2CxNxk3XTAzNxBkOWCiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ3NxU3NjQ5IiwKIEAiYZV0aF9ub25jXSIgOiAiMTAyNxUxIiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYWNjXZNxZ3Rva2VuIiA6IEJIXVFZVllPMxF2dGX0alprb2NFSmVNVjRLVFlnWCpDQyIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiEn0=
 
 cwogIEJrXZl3b3JkIiA6IELllK_lk4HkvJoiLAogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogIjgyXTYzYxQ3MDRiMDQ3MGNlNTNiMDVhOWI4ODg1OGU4ODhiMGQ5XGUiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ3NxU3NjUzIiwKIEAiYZV0aF9ub25jXSIgOiAiMTC1OTI0IiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYWNjXZNxZ3Rva2VuIiA6IEJIXVFZVllPMxF2dGX0alprb2NFSmVNVjRLVFlnWCpDQyIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiEn0=
 
 cwogIEJrXZl3b3JkIiA6IELnmb7luqYiLAogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogIjA5OWM3NmNlNxVjXWI2NmCyMjJhMxIwNjQ5Yjk5NjA4MWNjMjkzYmCiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ3NxU3NjU0IiwKIEAiYZV0aF9ub25jXSIgOiAiMTIzNTIxIiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYWNjXZNxZ3Rva2VuIiA6IEJIXVFZVllPMxF2dGX0alprb2NFSmVNVjRLVFlnWCpDQyIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiEn0=
 
 cwogIEJrXZl3b3JkIiA6IELljY7kvY8iLAogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogImU2NGM3MjliYxFiXmFmYjY0XTXjYxQ4MDMyODXjODdjYxA2NTgyXDkiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJkXZXpY2VfdHlwXSIgOiAiMiIsEiAgImF1dGhfdGltXZN0YW1wIiA6IEIzNDQ3NxU3NjU2IiwKIEAiYZV0aF9ub25jXSIgOiAiMTe2NDe0IiwKIEAiXW5jenlwdEIgOiAiYmFxXTY0IiwKIEAieGFnXSIgOiAiMSIsEiAgImRldmljXV9xXZJpYWwiIDogIjFFMjg5MjezLUM5NDktNDg5NE1EMkMzLUNCMkM0NUQ2MCC4Qi0zNDQ2NjA2NjYzIiwKIEAiYWNjXZNxZ3Rva2VuIiA6IEJIXVFZVllPMxF2dGX0alprb2NFSmVNVjRLVFlnWCpDQyIsEiAgImFweF9rXZkiIDogIjU1NTFiMTA5MTCzMDQiEn0=
 
 cwogIEJrXZl3b3JkIiA6IEJl5a625rSBIiwKIEAiY2hhbm5lbF9jb2RlIiA6IEJBeHBTdG9yXSIsEiAgImF1dGhfe2lnbmF0dZJlIiA6IEJkNGQ4NmU1YjJhN2QwOTVkNxNjXTQxNDBhNTkwYjdkN2I3MmNlYjliIiwKIEAiYZBwZ3XlenNpb24iIDogIjCuNi4yIiwKIEAiXGV2aWNlZ3R5eGUiIDogIjIiLAogIEJhdZRoZ3RpbWVxdGFteEIgOiAiMTQ0Nxe1NxY1OEIsEiAgImF1dGhfbm9uY2UiIDogIjCwNTMxNEIsEiAgImVuY3J5eHQiIDogImJhe2U2NEIsEiAgInBhX2UiIDogIjCiLAogIEJkXZXpY2Vfe2VyaWFsIiA6IEIzRTI4OTI3MS1DOTQ5LTQ4OTQtQjJDMS1DRDJDNDVCNjBBOCItMTQ0NjYwNjY2MSIsEiAgImFjY2Vxe190b2tlbiIgOiAiSGVRV1XXTxMzdnRmdGpaa29jRUplTVY0S1RXX1hKQ0MiLAogIEJheHBfa2V5IiA6IEI1NTUzYjCwOTCzMTA0Igp9
 */


+ (void)getHomePageWithsuccess:(void(^)(id response))block{
   
    [HttpRequest httpRequestWithURL:@"http://api.allfree.cc/api14/activity/homepage?ios_params=cwogIEJjaGFubmVsZ2NvXGUiIDogIkFweFN0b3JlIiwKIEAiYZV0aF9xaWduYZR1emUiIDogImVjY2M5N2YzOGRkYmCzXTC1NjI5NWQzXmQ3ODRiNDQzNxRkMGM4XDMiLAogIEJheHBfdmVye2lvbiIgOiAiMS42LjIiLAogIEJsYZN0Z3Xpe2l0IiA6IEIzNDQ3OTe5MxM2IiwKIEAiYWRfdHlwXSIgOiAiMSIsEiAgImRldmljXV90cZBlIiA6IEIyIiwKIEAiYZV0aF90aW1le3RhbZAiIDogIjC0NDe5NxkxNDMiLAogIEJhdZRoZ25vbmNlIiA6IEIzMTk4NTIiLAogIEJlbmNycZB0IiA6IEJiYZNlNjQiLAogIEJwYWdlIiA6IEIzIiwKIEAiXGV2aWNlZ3NlemlhbEIgOiAiMUUyODkyNxCtQxk0OS00ODk0LUIyQxCtQ0QyQxQ1RDYwQThELTC0NDY2MDY2NjCiLAogIEJhY2Nle3NfdG9rXW4iIDogIkhlUVdWWU8xMZX0XnRqWmtvY0VKXU1WNCtUWWdYSkNDIiwKIEAiYZBwZ2tlcSIgOiAiNTU1MWIzMDkzMTCwNEIKfQ==" WithParmas:nil WithHttpMethod:@"POST" WithSuccessBlock:^(id responseObj) {
       
        block(responseObj);
        
    } WithFailBlock:^(NSHTTPURLResponse *response) {
        
        
    }];
    
}

+ (void)getDataWithURLstring:(NSString *)url Withsuccess:(void(^)(id response))block{
    
    [HttpRequest httpRequestWithURL:url WithParmas:nil WithHttpMethod:@"POST" WithSuccessBlock:^(id responseObj) {
        
        block(responseObj);
        
    } WithFailBlock:^(NSHTTPURLResponse *response) {
        
        NSLog(@"请求失败");
        
    }];
    
    
}

@end
