//
//  SellerModel.h
//  项目三
//
//  Created by Macx on 15/11/13.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "BaseModel.h"

@interface SellerModel : BaseModel


/*
 {
 "seller_id" = 251;
 "seller_pic" = "http://7pn6do.com1.z0.glb.clouddn.com/145639841855f2bce9d14b76.91568687.png";
 "seller_title" = "\U6ef4\U6ef4\U51fa\U884c";
 "seller_type" = 0;
 "seller_url" = "http://www.xiaojukeji.com/website/index.html";
 }
 
 
 
 */

@property (nonatomic ,strong)NSNumber *seller_id;
@property (nonatomic ,copy)NSString *seller_pic;
@property (nonatomic , copy)NSString *seller_title;
@property (nonatomic ,strong)NSNumber *seller_type;
@property (nonatomic , copy)NSString *seller_url;


@end
