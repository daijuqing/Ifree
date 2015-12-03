//
//  RankModel.h
//  项目三
//
//  Created by Macx on 15/11/26.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "BaseModel.h"

@interface RankModel : BaseModel

/*
 
 "rank": [
 {
 "rank": "1",
 "nickname": "景芯",
 "viewnum": "188",
 "fund_num": "2",
 "is_self": "0",
 "ban": "0",
 "win": "1"
 */

@property (nonatomic ,copy)NSNumber *rank;

@property (nonatomic ,copy)NSString *nickname;

@property (nonatomic ,copy)NSNumber *viewnum;

@property (nonatomic ,copy)NSNumber *fund_num;

@property (nonatomic ,copy)NSNumber *is_self;

@property (nonatomic ,copy)NSNumber *ban;

@property (nonatomic ,copy)NSNumber *win;


@end
