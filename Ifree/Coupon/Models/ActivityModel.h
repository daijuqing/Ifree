//
//  ActivityModel.h
//  项目三
//
//  Created by Macx on 15/11/15.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "BaseModel.h"

@interface ActivityModel : BaseModel

/*
 activity =     {
 "activity_id" = 4432;
 "detail_url" = "http://api.allfree.cc/share/html/?id=4432";
 "end_date" = 1448985599;
 finish = 0;
 intro = "";
 "join_num" = 98;
 pic = "http://7pn6do.com1.z0.glb.clouddn.com/56054828956459969430787.98370513.JPG";
 "remain_num" = 902;
 seller =         {
 "seller_id" = 374;
 "seller_pic" = "http://7pn6do.com1.z0.glb.clouddn.com/187446900455aaf9ddb1e037.66041853.png";
 "seller_title" = "\U672c\U6765\U751f\U6d3b";
 "seller_url" = "http://m.benlai.com/";
 };
 share =         {
 "share_title" = "18\U4e2a\U82f9\U679c30\U5143\Uff0c\U5c31\U5728\U5168\U6c11\U514d\U8d39\Uff01";
 "share_url" = "http://api.allfree.cc/share/?id=4432";
 "shared_integral" = 5;
 };
 "shared_nums" = 500;
 "show_pic" = "http://7pn6do.com1.z0.glb.clouddn.com/134435284564599698238d5.92193697.JPG";
 "start_date" = 1447344000;
 title = "18\U4e2a\U82f9\U679c30\U5143\U8fd8\U5305\U90ae\U3010\U9650\U6c5f\U6d59\U6caa\U3011";
 "view_nums" = 1075;
 };

 */

@property (nonatomic ,copy)NSNumber *activity_id;
@property (nonatomic ,copy)NSString *detail_url;
@property (nonatomic ,copy)NSNumber *end_date;
@property (nonatomic ,copy)NSNumber *finish;
@property (nonatomic ,copy)NSNumber *join_num;
@property (nonatomic ,copy)NSString *pic;
@property (nonatomic ,copy)NSNumber *remain_num;
@property (nonatomic ,copy)NSDictionary *seller;

@property (nonatomic ,copy)NSDictionary *share;


@property (nonatomic ,copy)NSNumber *shared_nums;
@property (nonatomic ,copy)NSString *show_pic;
@property (nonatomic ,copy)NSNumber *start_date;
@property (nonatomic ,copy)NSString *title;
@property (nonatomic ,copy)NSNumber *view_nums;

@property (nonatomic ,copy)NSArray *taglist;



/*
 
 {
 activity =     {
 "activity_id" = 4212;
 "detail_url" = "http://api.allfree.cc/share/html/?id=4212";
 "end_date" = 1451577599;
 finish = 0;
 intro = "";
 "join_num" = 7555;
 pic = "http://7pn6do.com1.z0.glb.clouddn.com/651728969561b445e2c6301.07405793.jpg";
 "remain_num" = 2445;
 seller =         {
 "seller_id" = 528;
 "seller_pic" = "";
 "seller_title" = "\U55e8\U6dd8\U5168\U7403";
 "seller_url" = "";
 };
 share =         {
 "share_title" = "\U5927\U4fc3\U9500\Uff0155\U5143\U97e9\U59865\U4ef6\U5957\Uff0c\U73b0\U5728\U53ea\U9700\U89815\U5143\U5373\U53ef\U5305\U90ae\U9001\U5230\Uff01\U901f\U5ea6\U62a2\Uff01\Uff01";
 "share_url" = "http://api.allfree.cc/share/?id=4212";
 "shared_integral" = 10;
 };
 "shared_nums" = 1796;
 "show_pic" = "http://7pn6do.com1.z0.glb.clouddn.com/927116987561b445e6b7d44.15797464.jpg";
 "start_date" = 1444579200;
 title = "\U97e9\U5986\U4e94\U4ef6\U5957\Uff0c5\U5143\U5305\U90ae\U9001\Uff01";
 "view_nums" = 18012;
 };
 "activity_id" = 4212;
 "ad_type" = 0;
 pic = "http://7pn6do.com1.z0.glb.clouddn.com/133128467456472aa52ef5c1.08586375.jpg";
 }
 
 
 */

@end
