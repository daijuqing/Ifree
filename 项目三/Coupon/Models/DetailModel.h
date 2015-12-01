//
//  DetailModel.h
//  项目三
//
//  Created by Macx on 15/11/13.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "BaseModel.h"

#import "ActivityModel.h"

@interface DetailModel : BaseModel

/*
 
 "activity_id" = 0;
 "ad_type" = 2;
 "h5_link" = "http://api.allfree.cc/bd/nine";
 pic = "http://7pn6do.com1.z0.glb.clouddn.com/263410925642df4c45d527.04732630.jpg";
 */

@property (nonatomic ,copy)NSNumber *activity_id;
@property (nonatomic ,copy)NSNumber *ad_type;
@property (nonatomic ,copy)NSString *h5_link;
@property (nonatomic ,copy)NSString *pic;
@property (nonatomic ,copy)NSDictionary *activity;
@property (nonatomic ,strong)ActivityModel *activityModel;

@end
