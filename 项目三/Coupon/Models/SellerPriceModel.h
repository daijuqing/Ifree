//
//  SellerPriceModel.h
//  项目三
//
//  Created by Macx on 15/11/23.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "BaseModel.h"

@interface SellerPriceModel : BaseModel

/*
 
 "id": "179",
 "seller_id": "281",
 "title": "C26 香辣鸡翅（2块）+黄金鸡块（5块）+薯条（中）+红豆派（1个）",
 "price": "25.5",
 "end_date": "1448899200",
 "pic": "http://7pn6do.com1.z0.glb.clouddn.com/19601940995636f77c01c249.09804969.jpg",
 "show_pic": "http://7pn6do.com1.z0.glb.clouddn.com/17350609465636f77c17e921.71442318.jpg"
 */


@property (nonatomic ,copy)NSNumber *seller_id;
@property (nonatomic ,copy)NSString *title;
@property (nonatomic ,copy)NSString *end_date;
@property (nonatomic ,copy)NSString *pic;
@property (nonatomic ,copy)NSString *show_pic;
@property (nonatomic, copy)NSNumber *pri;

@end
