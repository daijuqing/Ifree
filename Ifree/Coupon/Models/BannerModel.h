//
//  BannerModel.h
//  项目三
//
//  Created by Macx on 15/11/13.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "BaseModel.h"

@interface BannerModel : BaseModel

/*
 
 activity =     ;
 "activity_id" = 4212;
 "ad_type" = 0;
 pic = "http://7pn6do.com1.z0.glb.clouddn.com/80121225856454b4066ab34.11635522.jpg";

 */


@property (nonatomic ,copy)NSDictionary *activity;
@property (nonatomic ,copy)NSNumber *activity_id;
@property (nonatomic ,copy)NSNumber *ad_type;
@property (nonatomic ,copy)NSString *pic;



@end
