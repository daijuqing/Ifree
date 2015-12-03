//
//  HeaderView.m
//  项目三
//
//  Created by Macx on 15/11/13.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import "HeaderView.h"
#import "DetailModel.h"
#import "BannerView.h"

#import "SellerView.h"


#import "SegmentScrollView.h"

#import "ActivityViewController.h"


@implementation HeaderView
{
    
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    BannerView *_bannerView;
    SellerView *_sellerView;
//    SegmentScrollView *_segmentScrollView;
    

    
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor lightGrayColor];
        
    }
    
    return self;
    
}
- (void)setSellerDataList:(NSArray *)sellerDataList{
    
    _sellerDataList = sellerDataList;
    [self createSllerView];//商家推荐

}

- (void)setDataList:(NSArray *)dataList{
    
    _dataList = dataList;
    
    [self creatScrollView];//轮播图


}


- (void)setBannerDataList:(NSArray *)bannerDataList{
    
    _bannerDataList = bannerDataList;
    
    [self creatBannerView];//精品推荐
    
    
}

//商家推荐
- (void)createSllerView{
    
    _sellerView = [[SellerView alloc]initWithFrame:CGRectMake(0,_bannerView.bottom + 5, self.frame.size.width, 140)];
    _sellerView.dataList = _sellerDataList;
    [self addSubview:_sellerView];
    
    
    CGRect frame = self.frame;
    
    frame.size.height = _sellerView.bottom + 5;
    
    self.frame = frame;
    
}

//轮播图
- (void)creatScrollView{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 120)];
    [self addSubview:_scrollView];
    _scrollView.contentSize = CGSizeMake(self.frame.size.width * _dataList.count , self.frame.size.height);
    _scrollView.tag = 1001;
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    
    
    for (int i = 0; i < _dataList.count; i ++) {
        
        DetailModel *model = [_dataList objectAtIndex:i];
        
        UIButton *imageBtn = [[UIButton alloc] initWithFrame:CGRectMake(i *self.frame.size.width, 0,self.frame.size.width , 120)];
        imageBtn.tag = 1100 + i;
        [imageBtn addTarget:self action:@selector(headerBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:imageBtn.frame];
        [_scrollView addSubview:imageView];
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.pic]];
        
        
        [_scrollView addSubview:imageBtn];
        
        
    }
    
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, 30)];
    
    //设置pageControll的页数
    _pageControl.numberOfPages = _dataList.count;

    //当前页数
    _pageControl.currentPage = 0;
    
    [self addSubview:_pageControl];
}




//精品推荐
- (void)creatBannerView{
    
    _bannerView = [[BannerView alloc]initWithFrame:CGRectMake(0, _scrollView.bottom + 1, self.frame.size.width, 200)];
    _bannerView.dataList = _bannerDataList;
    _bannerView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:_bannerView];
    
}

- (void)headerBtnAction:(UIButton *)btn{
    DetailModel *model = [_dataList objectAtIndex:(btn.tag-1100)];
        
    if ([model.activity_id intValue] != 0) {
        
        ActivityViewController *vc = [[ActivityViewController alloc]init];
        vc.detailModel = model;
        vc.navigationController.title = @"活动详情";
        [self.viewController.navigationController pushViewController:vc animated:YES];
        return;

    }
    
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (scrollView.tag == 1001) {

        //计算当前的页数
        NSInteger index = scrollView.contentOffset.x/kScreenWidth;
        _pageControl.currentPage = index;
        
    }
    
}




- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y != 0 ) {
        
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, 0);
      
        return;
    }
    
}



@end
