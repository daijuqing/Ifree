//
//  CustomTabBarController.m
//  ptoject1
//
//  Created by Mac on 15/7/17.
//  Copyright (c) 2015年 BV-3G. All rights reserved.
//

#import "CustomTabBarController.h"
#import "TabBarItem.h"



@interface CustomTabBarController ()
{

    UIView *_newTabBar;

    UIImageView *_selectedImageView;

}
@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //2.创建新的tabbar
    _newTabBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 49)];
    
    _newTabBar.backgroundColor = [UIColor whiteColor];
    
    [self.tabBar addSubview:_newTabBar];
    
    
}

-(void)setViewControllers:(NSArray *)viewControllers{

    [super setViewControllers:viewControllers];
    
    [self creatTabBarItem:viewControllers.count];
    
}

- (void)creatTabBarItem:(NSInteger)itemCount {

    
    int i;
    
    _newTabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:_bgImageName]];
    
    _selectedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/itemCount, 49)];
    
//    _selectedImageView.image = [UIImage imageNamed:_selectedImageName];
    
//    [_newTabBar addSubview:_selectedImageView];
    
    for (UIViewController *vc in self.viewControllers) {
        
        TabBarItem *item = [[TabBarItem alloc] initWithFrame:CGRectMake(i *self.view.frame.size.width/itemCount, 0, self.view.frame.size.width/itemCount, 49) withTabBarItem:vc.tabBarItem];
        [_newTabBar addSubview:item];
        item.tag = 100+i;
        [item addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
        
        i ++;
    }
    
    TabBarItem *firstIteam = (TabBarItem *)[_newTabBar viewWithTag:100];

    [self itemAction:firstIteam];
}


- (void)itemAction:(TabBarItem *)item {

    [self setSelectedIndex:item.tag -100];
    
    for (TabBarItem *tabIteam in _newTabBar.subviews) {
        
        if ([tabIteam isKindOfClass:[TabBarItem class]]) {
            
            if (item.tag != tabIteam.tag) {
                
                tabIteam.selectedImage = [NSString stringWithFormat:@"tab_%ld_unselect",tabIteam.tag - 100];

                tabIteam.titleColor = [UIColor blackColor];
            }
     
        }
    }
    
    item.selectedImage = [NSString stringWithFormat:@"tab_%ld_select",item.tag - 100];
    item.titleColor = [UIColor colorWithRed:53/255.f green:186/255.f blue:178/255.f alpha:1];
    
    [UIView animateWithDuration:.2 animations:^{
       
        _selectedImageView.center = item.center;
        
    }];
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    //1.移除原生的按钮
    for (UIView *view in self.tabBar.subviews) {
        
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            [view removeFromSuperview];
        }
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
