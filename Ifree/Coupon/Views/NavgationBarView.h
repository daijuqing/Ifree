//
//  NavgationBarView.h
//  项目三
//
//  Created by Macx on 15/11/15.
//  Copyright (c) 2015年 Macx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface NavgationBarView : UIView<UITextFieldDelegate>

@property (nonatomic ,strong)UITextField *searchTextField;

@property (nonatomic ,strong)UIView *mySuperView;

@property (nonatomic ,strong)UIViewController *superViewController;



@end
