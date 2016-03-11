//
//  MyCenterViewController.h
//  Login_登陆界面
//
//  Created by lanou on 15/11/17.
//  Copyright (c) 2015年 9527. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyCenterViewController : UIViewController
{

    UIImageView *bgView;
    UIVisualEffectView *effectview;
    
    NSString *docPath;
    NSFileManager *manager;
    NSString *bgPicPath;
}


@end
