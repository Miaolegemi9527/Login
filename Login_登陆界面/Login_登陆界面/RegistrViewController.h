//
//  RegistrViewController.h
//  Login_登陆界面
//
//  Created by lanou on 15/11/13.
//  Copyright (c) 2015年 9527. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface RegistrViewController : UIViewController

{
    UIImageView *imageV;
    UILabel *userName;
    UITextField *userNametf;
    UILabel *passWord;
    UITextField *passWordtf;
    UITextField *passWordtfAgain;
    UILabel *passwalabel;
    UILabel *email;
    UITextField *emailtf;
    UILabel *phoneNumber;
    UITextField *phoneNumbertf;
    UIButton *defineButton;
    UIButton *cancelButton;
    
    //全局 点击空白处收起键盘
    UIScrollView *bgsv;
}

@end
