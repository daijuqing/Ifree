//
//  BannerActivityModel.h
//  项目三
//
//  Created by Macx on 15/11/13.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "BaseModel.h"

@interface BannerActivityModel : BaseModel

/*
 {
 "activity_id" = 4212;
 "detail_url" = "http://api.allfree.cc/share/html/?id=4212";
 "end_date" = 1451577599;
 finish = 0;
 intro = "";
 "join_num" = 7082;
 pic = "http://7pn6do.com1.z0.glb.clouddn.com/651728969561b445e2c6301.07405793.jpg";
 "remain_num" = 2918;
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
 "shared_nums" = 1722;
 "show_pic" = "http://7pn6do.com1.z0.glb.clouddn.com/927116987561b445e6b7d44.15797464.jpg";
 "start_date" = 1444579200;
 title = "\U97e9\U5986\U4e94\U4ef6\U5957\Uff0c5\U5143\U5305\U90ae\U9001\Uff01";
 "view_nums" = 16492;
 }
 */


@property (nonatomic ,copy)NSNumber *activity_id;
@property (nonatomic ,copy)NSString *detail_url;
@property (nonatomic ,copy)NSNumber *end_date;
@property (nonatomic ,assign)BOOL finish;
@property (nonatomic ,copy)NSString *intro;
@property (nonatomic ,copy)NSNumber *join_num;

@end
