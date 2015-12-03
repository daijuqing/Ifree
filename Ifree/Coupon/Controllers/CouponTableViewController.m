//
//  CouponTableViewController.m
//  项目三
//
//  Created by Macx on 15/11/12.
//  Copyright (c) 2015年 Macx. All rights reserved.
//
#define ScreeFrame [UIScreen mainScreen].bounds

#define kSegmentScrollViewH 40

#import "CouponTableViewController.h"
#import "HeaderView.h"

#import "DetailModel.h"
#import "BannerModel.h"
#import "SellerModel.h"

#import "NavgationBarView.h"


#import "Dview.h"

#import "ListTableViewController.h"

#import "ListTableView.h"

@interface CouponTableViewController ()

@property (strong, nonatomic) NSMutableArray *controllsArray;

@end

@implementation CouponTableViewController
{
    HeaderView *_headerView;//头视图
    
    NSMutableArray *_dataList;
    
    NSMutableArray *_bannerDataList;
    
    NSMutableArray *_sellerDataList;
    
    NSArray *_segmentTypeList;
    
    UITextField *_searchTextField;
    NavgationBarView *_navgationTitleView;
    
    
    Dview *_segV;
    NSMutableArray *_tableViews;
    
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self loadData];//加载数据

    

    
}

- (void)creatNavgation{
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_ok"]];

    _navgationTitleView = [[NavgationBarView alloc]initWithFrame:self.navigationController.navigationBar.bounds];
    
    _navgationTitleView.layer.cornerRadius = 8;
    _navgationTitleView.clipsToBounds = YES;
    _navgationTitleView.mySuperView = self.view;
    _navgationTitleView.superViewController = self;
    
    [self.navigationController.navigationBar addSubview:_navgationTitleView];

        
}

- (void)creatSeg{
    
    _segV = [[Dview alloc]initWithFrame:CGRectMake(0, _headerView.bottom , kScreenWidth, kScreenHieght)];
    _tableViews = [[NSMutableArray alloc]init];

    //循环创建下部滑动tablevie
    for (int i = 0; i < _segmentTypeList.count; i ++) {
        
        ListTableView *listTableview = [[ListTableView alloc]initWithFrame:self.view.bounds];
        [_tableViews addObject:listTableview];
    }
    _segV.ScrollTablesArr = _tableViews;
    
    _segV.nameArr = (NSMutableArray *)_segmentTypeList;
    
    [self.view addSubview:_segV];
    
    
}



//加载数据
- (void)loadData{
    
    [DNetWorkCore getAppdataWithsuccess:^(id response) {
        
        NSDictionary *dic = response;
        // dic内字典key值 return_data/所有数据所在 return_code/200 return_msg/success
        
        
        
        id data = [dic objectForKey:@"return_data"];
        // data内字典key值 banner seller current_type recommend totalnum added_nums typelist list
        
        id banner = [data objectForKey:@"banner"];//精品推荐
        _bannerDataList = [[NSMutableArray alloc]init];
        for (NSDictionary *dic in banner) {
           
            DetailModel *model = [[DetailModel alloc]initWithDictionary:dic];
            [_bannerDataList addObject:model];
            
        }
        
    
        id seller = [data objectForKey:@"seller"];//商家推荐
        
        _sellerDataList = [[NSMutableArray alloc]init];
        for (NSDictionary *dic in seller) {
            
            SellerModel *model = [[SellerModel alloc]initWithDictionary:dic];
            [_sellerDataList addObject:model];
            
        }
        
//        id current_type = [data objectForKey:@"current_type"];
        
        id recommend = [data objectForKey:@"recommend"];//轮播图数据
        
        _dataList = [[NSMutableArray alloc]init];
        
        for (id iteam in recommend) {
            
            DetailModel *model = [[DetailModel alloc]initWithDictionary:iteam];
            
            [_dataList addObject:model];
            
        }
        
//        id totalnum = [data objectForKey:@"totalnum"];//40
        
        
//        id added_nums = [data objectForKey:@"added_nums"];//0
        
        _segmentTypeList = [[NSArray alloc]init];
        id typelist = [data objectForKey:@"typelist"];//精选,优惠,最新上线, 无门槛,话费,流量,现金红包
        _segmentTypeList = typelist;
        
        
//        id list = [data objectAtIndex:@"list"];//return_data
        
        
        [self creatNavgation];
        
        [self creatHeaderView];//头视图
        
        
        
        
        _headerView.dataList = _dataList;
        
        _headerView.bannerDataList = _bannerDataList;

        _headerView.sellerDataList = _sellerDataList;
        

        

        [self creatSeg];//changjia


        
    }];
    
}

//头视图
- (void)creatHeaderView{

    _headerView = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHieght)];
    
    UIView *clearView = [[UIView alloc]initWithFrame:_headerView.frame];
    clearView.backgroundColor = [UIColor clearColor];
    
    self.tableView.tableHeaderView = clearView;
    
    [self.view addSubview:_headerView];
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
             [self.tableView.header endRefreshing];
            
        });
        
    }];

    [self.tableView.header beginRefreshing];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    return cell;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    
    if (offsetY >= _headerView.bottom - 64 - 49) {
        
        for (ListTableView *list in _tableViews)
        {
            list.scrollEnabled = YES;
        }
        
        _segV.top = offsetY + 64;
        
        NSLog(@"%f",offsetY);
        
        return;
    }

    
    for (ListTableView *list in _tableViews)
    {
        list.scrollEnabled = NO;
    }
    _segV.top = _headerView.bottom;
    
    NSLog(@"%f",offsetY);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.view.frame.size.height - 64 - 44;
    
}


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
 

    
    self.tabBarController.tabBar.hidden = NO;
    
    _navgationTitleView.hidden = NO;
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_ok"]];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
//    for (UIView *view in self.navigationController.navigationBar.subviews) {
//        
//        if ([view isKindOfClass:[NavgationBarView class]]) {
//            
//            [view removeFromSuperview];
//
//        }
//    }
    
//    self.tabBarController.tabBar.hidden = YES;
   
    _navgationTitleView.hidden = YES;
}




@end
