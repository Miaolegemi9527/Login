//
//  ListViewController.h
//  Login_登陆界面
//
//  Created by lanou on 15/11/16.
//  Copyright (c) 2015年 9527. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListTableViewCell.h"
#import "SettingViewController.h"
#import "MyCenterViewController.h"


@interface ListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    UIButton *mButton;
    UIButton *settingButton;
    UIButton *myCenter;
    UITableView *tab;
    
    UIImageView *bgView;
    //毛玻璃效果
    UIVisualEffectView *effectview;

}

@end
