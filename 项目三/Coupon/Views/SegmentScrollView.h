//
//  SegmentScrollView.h
//  项目三
//
//  Created by Macx on 15/11/14.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^SegmentBlock)(NSInteger index);


@interface SegmentScrollView : UIView<UIScrollViewDelegate>
{
    
    SegmentBlock _segmentBlock;
    
}

@property (nonatomic,copy)NSArray *titles;
@property (nonatomic ,copy)UIScrollView *segScrollView;
@property (nonatomic, assign)NSInteger selectIndex;


- (void)addBlock:(SegmentBlock)block;


@end
