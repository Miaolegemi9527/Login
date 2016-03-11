//
//  RootViewController.h
//  Login_登陆界面
//
//  Created by lanou on 15/11/12.
//  Copyright (c) 2015年 9527. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegistrViewController.h"
#import "FindPasswordBackViewController.h"
#import "ListViewController.h"
#import "RKDropdownAlert.h"
//视图闪烁
#import "FBShimmeringView.h"
#import "ViewController.h"


@interface RootViewController : UIViewController

{
    UIImageView *imageHeadMove;
    UIButton *registerButton;
    UIButton *findPassWordButton;
    
    UIImageView *imageV;
    UITextField *useNametf;
    UILabel *userLabel;
    UILabel *passWordLabel;
    UITextField *passWordtf;
    UIButton *loginButoon;
    
    UILabel *verticalLabel;
    UILabel *registervl;
    UILabel *findPassWordvl;
    //毛玻璃效果
    UIVisualEffectView *effectview;
    //点击头像 记录一次 注册/密码 动态效果使用到
    NSUserDefaults *de;
    //闪烁视图 LOGIN
    FBShimmeringView *loginShanshuoView;
    
}

@end
