//
//  RushModel.h
//  项目三
//
//  Created by Macx on 15/11/24.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "BaseModel.h"

@interface RushModel : BaseModel

/*
 
 {
 "activity_id" = 632;
 "detail_url" = "http://api.allfree.cc/share/viewrob/?fsid=632&ds=1E289271-C949-4894-B2C1-CD2C45D60A8B-1446606661";
 "end_date" = 1443924000;
 finish = 1;
 intro = "";
 "join_num" = 66;
 pic = "http://7pn6do.com1.z0.glb.clouddn.com/15778466115609c9ee6e7086.80430955.jpg";
 seller =     {
 "seller_id" = 423;
 "seller_pic" = "";
 "seller_title" = "e\U4ee3\U9a7e";
 "seller_url" = "";
 };
 share =     {
 "share_title" = "\U5feb\U6765\U5e2e\U6211\U62a2e\U4ee3\U9a7e39\U5143\U8d35\U5bbe\U4ee3\U91d1\U5238\Uff01";
 "share_url" = "http://api.allfree.cc/share/rob/?fsid=632";
 };
 "show_pic" = "http://7pn6do.com1.z0.glb.clouddn.com/12321143015609c9eea2faa9.62620449.jpg";
 "start_date" = 1443751200;
 title = "\U514d\U8d39\U62a2e\U4ee3\U9a7e39\U5143\U8d35\U5bbe\U4ee3\U91d1\U5238";
 "total_num" = 5;
 }
 
 */

@property (nonatomic ,copy)NSNumber *activity_id;
@property (nonatomic ,copy)NSString *detail_url;

@property (nonatomic ,copy)NSNumber *end_date;
@property (nonatomic ,copy)NSNumber *finish;
@property (nonatomic ,copy)NSString *intro;

@property (nonatomic ,copy)NSNumber *join_num;

@property (nonatomic ,copy)NSString *pic;


@property (nonatomic ,copy)NSDictionary *seller;
@property (nonatomic ,copy)NSDictionary *share;
@property (nonatomic ,copy)NSString *show_pic;
@property (nonatomic ,copy)NSNumber *start_date;
@property (nonatomic ,copy)NSString *title;
@property (nonatomic ,copy)NSNumber *total_num;




@end
