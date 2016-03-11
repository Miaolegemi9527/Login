//
//  ViewController.h
//  Login_登陆界面
//
//  Created by lanou on 15/11/29.
//  Copyright (c) 2015年 9527. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    NSMutableArray *dataArray;
    
    //需要声明一个全局BOOL变量isOpen，记录当前cell的状态，声明一个NSInterge类型selectedIndex，记录选择的cell的row。
    BOOL isOpen;
    NSInteger selectedIndex;
}

@end
