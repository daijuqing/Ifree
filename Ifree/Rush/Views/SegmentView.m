//
//  SegmentView.m
//  项目三
//
//  Created by Macx on 15/11/23.
//  Copyright (c) 2015年 Macx. All rights reserved.
//


//顶部scrollview到底部scrollview 减去的距离
#define topTObottomSpace 30

#define statusBar 20
#define Tablebar 49
#define TopScHeight 80
#define BottomScHeight [UIScreen mainScreen].bounds.size.height - TopScHeight - statusBar - Tablebar
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ButtonFont 16
#define LineHeght 3
//按钮之间的间隔
#define GapOfButton 30.0

#define line_jian 15


#import "SegmentView.h"

@implementation SegmentView

{
    UIView *_topView;
    NSMutableArray *_centerArr;//顶部按钮的中心点
    NSMutableArray *_widthArr;//顶部按钮的宽度
    UILabel *_line;//滑块
    
    UIScrollView *_bottomScroll;//底部
    
    BOOL _isBtnClick;
    
    NSInteger _FinalPage;
    
    float lastP;
    
    
    
}


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        
        self.ScrollTablesArr = [[NSMutableArray alloc]init];
        
        _centerArr = [[NSMutableArray alloc]init];
        _widthArr = [[NSMutableArray alloc]init];
        
        _line = [[UILabel alloc] init];
        
    }
    return self;
    
}


- (void)setNameArr:(NSMutableArray *)nameArr{
    
    _nameArr = nameArr;
    
    [self setSubViews];
    
}


-(void)setSubViews{
    
    _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, TopScHeight)];
    [self addSubview:_topView];
    _topView.backgroundColor = [UIColor whiteColor];
;
    
    
    //按钮的高与TopScroll一致
//    float contenX = GapOfButton;
    for (int i =0 ; i < _nameArr.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:_nameArr[i] forState:UIControlStateNormal];
        button.titleLabel.font  = [UIFont systemFontOfSize:ButtonFont];
//        CGSize size = [button.currentTitle sizeWithFont:[UIFont systemFontOfSize:ButtonFont] constrainedToSize:CGSizeMake(1000, 40)];
        button.frame = CGRectMake(kScreenWidth/2 * i, 0, kScreenWidth/2, TopScHeight);
        //button.backgroundColor = [UIColor orangeColor];
//        contenX = button.frame.origin.x + size.width + GapOfButton;
        button.tag = 200 + i;
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_topView addSubview:button];
        NSNumber *num = [NSNumber numberWithFloat:button.center.x];
        [_centerArr addObject:num];
        NSNumber *num2 = [NSNumber numberWithFloat:button.frame.size.width];
        [_widthArr addObject:num2];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //        [button setTitleColor:[UIColor colorWithRed:53/255.f green:186/255.f blue:178/255.f alpha:1] forState:UIControlStateHighlighted];
    }
    
    
    
    
    
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, TopScHeight - LineHeght - line_jian + 2, _topView.width, 1)];
//    view.backgroundColor = [UIColor lightGrayColor];
//    [_topView addSubview:view];
    
    
    
    NSNumber *num = [_centerArr firstObject];
    NSNumber *num2 = [_widthArr firstObject];
    _line.frame = CGRectMake(num.floatValue - num2.floatValue/2, TopScHeight - LineHeght - line_jian, num2.floatValue, LineHeght);
    [_topView addSubview:_line];
    _line.backgroundColor = [UIColor colorWithRed:53/255.f green:186/255.f blue:178/255.f alpha:1];
    NSLog(@"%@",NSStringFromCGRect(_line.frame));
    
    
    
    _bottomScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, TopScHeight - topTObottomSpace + 15, ScreenWidth, BottomScHeight)];
    _bottomScroll.delegate = self;
    [self addSubview:_bottomScroll];
    _bottomScroll.contentSize = CGSizeMake(ScreenWidth * _ScrollTablesArr.count, BottomScHeight);
    _bottomScroll.pagingEnabled = YES;
    _bottomScroll.clipsToBounds = YES;
    _bottomScroll.bounces = NO;
    
    int j =0 ;
    //    for (UITableViewController *controller in _ScrollTablesArr) {
    //        controller.view.frame = CGRectMake(ScreenWidth * j , 0, ScreenWidth, BottomScHeight);
    //
    //        //NSLog(@"%@",NSStringFromCGRect(controller.view.frame));
    //        controller.tableView.scrollEnabled = NO;
    //
    //        [_bottomScroll addSubview:controller.view];
    //
    //        j++;
    //    }
    
    for (UITableView *tableview in _ScrollTablesArr) {
        
        tableview.frame = CGRectMake(ScreenWidth * j , 0, ScreenWidth, BottomScHeight);
        
        tableview.scrollEnabled = NO;
        [_bottomScroll addSubview:tableview];
        j ++;
        
    }
    
    UILabel *tableBar = [[UILabel alloc] initWithFrame:CGRectMake(0, ScreenHeight - Tablebar, ScreenWidth, Tablebar)];
    tableBar.text = @"tableBar";
    tableBar.backgroundColor = [UIColor blackColor];
    tableBar.textAlignment = NSTextAlignmentCenter;
    tableBar.textColor = [UIColor whiteColor];
    [self addSubview:tableBar];
    
    
    UIButton *btn = (UIButton *)[_topView viewWithTag:200];
    [self btnClick:btn];
}





- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (!_isBtnClick) {
        float needChange = 0;
        int a =0;
        for (int i =0;i<_centerArr.count;i++) {
            NSNumber *num = _centerArr[i];
            
            if (num.floatValue >= _line.center.x) {
                NSLog(@"num--%f  line ---%f",num.floatValue,_line.center.x
                      );
                
                if (i-1>=0) {
                    needChange = [_centerArr[i] floatValue] - [_centerArr[i-1] floatValue];
                    //NSLog(@"%f",needChange);
                    a = i;
                    break;
                    
                }
                
            }
        }
        
        float offset = 0;
        offset = needChange/ScreenWidth *(scrollView.contentOffset.x - (a -1) *ScreenWidth);
        if (a != 0) {
            _line.center = CGPointMake([_centerArr[a -1] floatValue] +  offset, TopScHeight - LineHeght/2.0 - line_jian);
        }
        _line.bounds = CGRectMake(0, 0, [_widthArr[a -1] floatValue] + ([_widthArr[a] floatValue] - [_widthArr[a - 1] floatValue])/ScreenWidth *(scrollView.contentOffset.x - (a -1) *ScreenWidth), LineHeght);
        lastP = scrollView.contentOffset.x;
    }
    
    
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    
    if (!decelerate) {
        _FinalPage = (NSInteger)scrollView.contentOffset.x/ScreenWidth;
//        [self changeTop];
    }
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger index = offsetX / [UIScreen mainScreen].bounds.size.width;
    
    
    
    UIButton *btn = (UIButton *)[_topView viewWithTag: 200+index];
    [self btnClick:btn];
    _FinalPage = (NSInteger)scrollView.contentOffset.x/ScreenWidth;
//    [self changeTop];
    
}


- (void)btnClick:(UIButton *)button{
    //    [self loadData];
    
    _isBtnClick = YES;
    _FinalPage = button.tag - 200;
    
    [self changeBottom:button];
//    [self changeTop];
    
    [self changeLine];
    
}

- (void)changeLine
{
    [UIView animateWithDuration:0.3 animations:^{
        //        line.center = CGPointMake([centerArr[FinalPage] floatValue], TopScHeight - LineHeght/2.0);
        //        line.bounds = CGRectMake(0, 0, [widthArr[FinalPage] floatValue], LineHeght);
        _line.frame = CGRectMake([_centerArr[_FinalPage] floatValue] -[_widthArr[_FinalPage] floatValue]/2.0 , TopScHeight - LineHeght - line_jian, [_widthArr[_FinalPage] floatValue], LineHeght);
    } completion:^(BOOL finished) {
        
    }];
}

//- (void)changeTop{
//    
//    _isBtnClick = NO;
//    float x = [_centerArr[_FinalPage] floatValue];
//    
//    [UIView animateWithDuration:0.3 animations:^{
//        if (x>ScreenWidth/2.0&&x<_topScroll.contentSize.width - ScreenWidth/2.0) {
//            _topScroll.contentOffset = CGPointMake(x-ScreenWidth/2.0, 0);
//        }
//        else if (x>=_topScroll.contentSize.width - ScreenWidth/2.0) {
//            _topScroll.contentOffset = CGPointMake(_topScroll.contentSize.width - ScreenWidth, 0);
//        }
//        else{
//            _topScroll.contentOffset = CGPointMake(0, 0);
//        }
//        
//    }];
//    
//}

- (void)changeBottom:(UIButton *)btn{
    
    [btn setTitleColor:[UIColor colorWithRed:53/255.f green:186/255.f blue:178/255.f alpha:1] forState:UIControlStateNormal];
    
    for (UIView *view in _topView.subviews) {
        
        if ([view isKindOfClass:[UIButton class]]) {
            
            UIButton *changeBtn = (UIButton *)view;
            
            if (changeBtn.tag != btn.tag) {
                
                [changeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }
        }
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        _bottomScroll.contentOffset = CGPointMake(ScreenWidth *_FinalPage, 0);
    } completion:^(BOOL finished) {
        
    }];
    
}


@end
