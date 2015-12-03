//
//  SegmentScrollView.m
//  项目三
//
//  Created by Macx on 15/11/14.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "SegmentScrollView.h"

//#define kSelectedImageName @"tab_selected_line"

@implementation SegmentScrollView
{
    
    UIImageView *_selectView;
    
}




- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
               
    }
    
    return self;

}


- (void)setTitles:(NSArray *)titles{
    
    _titles = titles;
    
    _segScrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    self.segScrollView.contentSize = CGSizeMake(80 * _titles.count, self.bounds.size.height);
    self.segScrollView.delegate = self;
    [self addSubview:self.segScrollView];
    [self creatIteam];
    
}
    
- (void)creatIteam{
    
    CGFloat width = 80;
    CGFloat height = 30;
    
    int index = 1;
    for (NSString *title in _titles) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake((index-1) *width +10, 0, width, height)];
        
        [button setTag:1200 +index];
        [button setTitle:title forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:53/255.f green:186/255.f blue:178/255.f alpha:1] forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.segScrollView addSubview:button];
 
        index ++;
        
    }
    
    _selectView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 30, width, 2)];
//    _selectView.image = [UIImage imageNamed:@"tab_selected_line"];
    UIImage *image = [UIImage imageNamed:@"tab_selected_line"];
//    UIImage *image1 = [image stretchableImageWithLeftCapWidth:1 topCapHeight:1];
    _selectView.image = image;
    
    _selectView.backgroundColor = [UIColor colorWithRed:53/255.f green:186/255.f blue:178/255.f alpha:1];
    [self.segScrollView addSubview:_selectView];
    
}

- (void)buttonAction:(UIButton *)sender{
    
    NSInteger index = sender.tag - 1200;
    
    [UIView animateWithDuration:.2 animations:^{
        
        _selectView.frame = CGRectMake(80 *(index-1), 30, 80, 2);
        
        
    }];
    
    
    for (UIView *view in self.segScrollView.subviews) {
        
        if ([view isKindOfClass:[UIButton class]]) {
            
            UIButton *button = (UIButton *)view;
            button.selected = NO;
            button.titleLabel.font = [UIFont systemFontOfSize:15];
//            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];

        }
    }
    sender.selected = YES;
    sender.titleLabel.font = [UIFont systemFontOfSize:17];
    
    
    
    if (_segmentBlock) {
        
        _segmentBlock (index);
    }

    
}

- (void)setSelectIndex:(NSInteger)selectIndex {
    
    _selectIndex = selectIndex;
    
    UIButton *button = (UIButton *)[self.segScrollView viewWithTag:1200 +selectIndex];
    
    [self buttonAction:button];
    
}

- (void)addBlock:(SegmentBlock)block {
    
    _segmentBlock = block;
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
}

@end
