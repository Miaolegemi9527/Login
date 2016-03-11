//
//  RegistrViewController.m
//  Login_登陆界面
//
//  Created by lanou on 15/11/13.
//  Copyright (c) 2015年 9527. All rights reserved.
//

#import "RegistrViewController.h"

#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

@interface RegistrViewController ()

@property(nonatomic,strong)CAGradientLayer *gradientLayer;
@property(nonatomic,strong)NSTimer *timer;

@end

@implementation RegistrViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.layer.contents = (id)[UIImage imageNamed:@"registerBG.jpg"].CGImage;

    //滚动视图
    bgsv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    bgsv.showsVerticalScrollIndicator = NO;
    bgsv.userInteractionEnabled = YES;
    [self.view addSubview:bgsv];
    bgsv.contentSize = CGSizeMake(WIDTH, HEIGHT+100);
    //设置点击空白处（tab）收起键盘手势
    UITapGestureRecognizer *keyboardTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickKeyboardUp)];
    keyboardTap.numberOfTapsRequired = 1;
    //加上这句不会影响tableview 上的 action (button,cell selected...)
    keyboardTap.cancelsTouchesInView = NO;
    [bgsv addGestureRecognizer:keyboardTap];

    
    //头像
    //头像
    imageV = [[UIImageView alloc] initWithFrame:CGRectMake(100, -100, 100, 100)];//100 100
    imageV.center = CGPointMake(self.view.center.x, imageV.center.y);
    imageV.backgroundColor = [UIColor clearColor];
    imageV.image = [UIImage imageNamed:@"touxiang2"];
    imageV.layer.cornerRadius = 50;
    imageV.layer.masksToBounds = YES;
    imageV.alpha = 0.0;
    [bgsv addSubview:imageV];
    
    //用户名
    
    userNametf = [[UITextField alloc] initWithFrame:CGRectMake(-WIDTH, 240, WIDTH, 30)];
    userNametf.textAlignment = NSTextAlignmentCenter;
//    userNametf.placeholder = @"昵称";
    UIColor *NamePlaceholderColor = [UIColor colorWithRed:136/255.0 green:196/255.0 blue:80/255.0 alpha:0.8];
    userNametf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"昵称" attributes:@{NSForegroundColorAttributeName:NamePlaceholderColor}];
    userNametf.textColor = [UIColor colorWithRed:136/255.0 green:196/255.0 blue:80/255.0 alpha:1];
    userNametf.alpha = 0.0;
    [bgsv addSubview:userNametf];
    userName = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH, 270, 275, 1)];
    userName.backgroundColor = [UIColor colorWithRed:205/255.0 green:187/255.0 blue:130/255.0 alpha:0.8];
    userName.alpha = 0.0;
    [bgsv addSubview:userName];
    //密码
    
    passWordtf = [[UITextField alloc] initWithFrame:CGRectMake(WIDTH, 280, WIDTH, 30)];
//    passWordtf.placeholder = @"密码";
    UIColor *passwordPlaceholderColor = [UIColor colorWithRed:255/255.0 green:76/255.0 blue:83/255.0 alpha:0.8];
    passWordtf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"密码" attributes:@{NSForegroundColorAttributeName:passwordPlaceholderColor}];
    passWordtf.textAlignment = NSTextAlignmentCenter;
    passWordtf.textColor = [UIColor colorWithRed:255/255.0 green:76/255.0 blue:83/255.0 alpha:1];
    passWordtf.alpha = 0.0;
    passWordtf.secureTextEntry = YES;
    [bgsv addSubview:passWordtf];
    passWord = [[UILabel alloc] initWithFrame:CGRectMake(-WIDTH, 310, 275, 1)];
    passWord.backgroundColor = [UIColor colorWithRed:205/255.0 green:187/255.0 blue:130/255.0 alpha:0.8];
    passWord.alpha = 0.0;
    [bgsv addSubview:passWord];
    //确认密码
    passWordtfAgain = [[UITextField alloc] initWithFrame:CGRectMake(-WIDTH, 320, WIDTH, 30)];
    UIColor *pwaEmailPlaceholderColor = [UIColor redColor];
    passWordtfAgain.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"密码" attributes:@{NSForegroundColorAttributeName:pwaEmailPlaceholderColor}];
    passWordtfAgain.textAlignment = NSTextAlignmentCenter;
    passWordtfAgain.textColor = [UIColor colorWithRed:255/255.0 green:76/255.0 blue:83/255.0 alpha:1];
    passWordtfAgain.alpha = 0.0;
    passWordtfAgain.secureTextEntry = YES;
    [bgsv addSubview:passWordtfAgain];
    passwalabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH, 350, 275, 1)];
    passwalabel.backgroundColor = [UIColor colorWithRed:205/255.0 green:187/255.0 blue:130/255.0 alpha:0.8];
    passwalabel.alpha = 0.0;
    [bgsv addSubview:passwalabel];
    
    //邮箱
    emailtf = [[UITextField alloc] initWithFrame:CGRectMake(WIDTH, 360, WIDTH, 30)];
//    emailtf.placeholder = @"邮箱";
    UIColor *emailPlaceholderColor = [UIColor colorWithRed:255/255.0 green:76/255.0 blue:83/255.0 alpha:0.8];
    emailtf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"邮箱" attributes:@{NSForegroundColorAttributeName:emailPlaceholderColor}];
    emailtf.textAlignment = NSTextAlignmentCenter;
    emailtf.textColor = [UIColor colorWithRed:255/255.0 green:76/255.0 blue:83/255.0 alpha:1];
    emailtf.alpha = 0.0;
    [bgsv addSubview:emailtf];
    email = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH, 390, 275, 1)];
    email.backgroundColor = [UIColor colorWithRed:205/255.0 green:187/255.0 blue:130/255.0 alpha:0.8];
    email.alpha = 0.0;
    [bgsv addSubview:email];
    //手机
    phoneNumbertf = [[UITextField alloc] initWithFrame:CGRectMake(-WIDTH, 400, WIDTH, 30)];
    phoneNumbertf.placeholder = @"手机";
//    UIColor *phonePlaceholderColor = [UIColor blueColor];
//    phoneNumbertf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"手机" attributes:@{NSForegroundColorAttributeName:phonePlaceholderColor}];
    phoneNumbertf.textAlignment = NSTextAlignmentCenter;
    phoneNumbertf.textColor = [UIColor colorWithRed:141/255.0 green:106/255.0 blue:71/255.0 alpha:0.9];
    phoneNumbertf.alpha = 0.0;
    [bgsv addSubview:phoneNumbertf];
    phoneNumber = [[UILabel alloc] initWithFrame:CGRectMake(-self.view.frame.size.width, 430, 275, 1)];
    phoneNumber.backgroundColor = [UIColor colorWithRed:205/255.0 green:187/255.0 blue:130/255.0 alpha:0.8];
    phoneNumber.alpha = 0.0;
    [bgsv addSubview:phoneNumber];
    //注册
    defineButton = [UIButton buttonWithType:UIButtonTypeCustom];
    defineButton.backgroundColor = [UIColor colorWithRed:175/255.0 green:0 blue:35/255.0 alpha:0.8];
//    defineButton.backgroundColor = [UIColor colorWithRed:255/255.0 green:191/255.0 blue:134/255.0 alpha:0.7];
    defineButton.frame = CGRectMake(0, HEIGHT, 50, 50);
    defineButton.center = CGPointMake(self.view.center.x, defineButton.center.y);
    defineButton.layer.cornerRadius = 25;
    defineButton.layer.masksToBounds = YES;
    defineButton.alpha = 0.0;
    [defineButton setTitle:@"注册" forState:UIControlStateNormal];
    [defineButton addTarget:self action:@selector(defineing) forControlEvents:UIControlEventTouchUpInside];
    [bgsv addSubview:defineButton];

    //取消
    cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.backgroundColor = [UIColor grayColor];
    cancelButton.frame = CGRectMake(WIDTH, 530, 32, 32);//215
    cancelButton.layer.cornerRadius = 16;//226
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:14];//修改button字体
    cancelButton.layer.masksToBounds = YES;
    cancelButton.alpha = 0.0;
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(canceling) forControlEvents:UIControlEventTouchUpInside];
    [bgsv addSubview:cancelButton];
    
    
    
    
}



-(void)viewWillAppear:(BOOL)animated
{
    //加载动画效果
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:2.0];
//    CGPoint imageVpoint = imageV.center;
//    imageVpoint.y = 150;
//    [imageV setCenter:imageVpoint];
//    [imageV setAlpha:0.6];
//    [UIView commitAnimations];
    
    [UIView animateWithDuration:5.0 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint imageVpoint = imageV.center;
        imageVpoint.y = 150;
        [imageV setCenter:imageVpoint];
        [imageV setAlpha:0.8];//0.6
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:2.5 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGPoint userNametfPoint = userNametf.center;
            userNametfPoint.x = self.view.frame.size.width/2;
            [userNametf setCenter:userNametfPoint];
            [userNametf setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:2.5 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGPoint userNamePoint = userName.center;
            userNamePoint.x = self.view.frame.size.width/2;
            [userName setCenter:userNamePoint];
            [userName setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:3.0 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGPoint passwordtfPoint = passWordtf.center;
            passwordtfPoint.x = self.view.frame.size.width/2;
            [passWordtf setCenter:passwordtfPoint];
            [passWordtf setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:3.0 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGPoint passwordPoint = passWord.center;
            passwordPoint.x = self.view.frame.size.width/2;
            [passWord setCenter:passwordPoint];
            [passWord setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:3.0 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint passwordtfAPoint = passWordtfAgain.center;
        passwordtfAPoint.x = self.view.frame.size.width/2;
        [passWordtfAgain setCenter:passwordtfAPoint];
        [passWordtfAgain setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:3.0 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint passwALabelPoint = passwalabel.center;
        passwALabelPoint.x = self.view.frame.size.width/2;
        [passwalabel setCenter:passwALabelPoint];
        [passwalabel setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:3.5 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGPoint emailtfPoint = emailtf.center;
            emailtfPoint.x = self.view.frame.size.width/2;
            [emailtf setCenter:emailtfPoint];
            [emailtf setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:3.5 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGPoint emailPoint = email.center;
            emailPoint.x = self.view.frame.size.width/2;
            [email setCenter:emailPoint];
            [email setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:4.0 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGPoint phoneNumbertfPoint = phoneNumbertf.center;
            phoneNumbertfPoint.x = self.view.frame.size.width/2;
            [phoneNumbertf setCenter:phoneNumbertfPoint];
            [phoneNumbertf setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:4.0 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGPoint phoneNumberPoint = phoneNumber.center;
            phoneNumberPoint.x = self.view.frame.size.width/2;
            [phoneNumber setCenter:phoneNumberPoint];
            [phoneNumber setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:4.5 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGPoint defineButtonPoint = defineButton.center;
            defineButtonPoint.y = 525;
            [defineButton setCenter:defineButtonPoint];
            [defineButton setAlpha:0.7];//0.5
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:5.0 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGPoint cancelButtonPoint = cancelButton.center;
            cancelButtonPoint.x = 227;//226
            [cancelButton setCenter:cancelButtonPoint];
            [cancelButton setAlpha:0.6];//0.5
    } completion:^(BOOL finished) {
        
    }];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    //颜色渐变
    //初始化渐变层
    self.gradientLayer = [CAGradientLayer layer];
    imageV.alpha = 1;
    self.gradientLayer.frame = imageV.bounds;
    [imageV.layer addSublayer:self.gradientLayer];
    //设置渐变颜色的方向
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(0, 1);
    //设定颜色组
    self.gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,(__bridge id)[UIColor purpleColor].CGColor];
    //设定颜色分割点
    self.gradientLayer.colors = @[@(0.5f),@(1.0f)];
    //定时器
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(changeColor) userInfo:nil repeats:YES];
}
//颜色渐变
-(void)changeColor
{
    //定时改变颜色
    
    self.gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,(__bridge id)[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0].CGColor];
    //定时改变分割点
    self.gradientLayer.locations = @[@(arc4random()%10/10.0f),@(1.0f)];
}


-(void)viewWillDisappear:(BOOL)animated
{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGPoint imageVpoint = imageV.center;
    imageVpoint.y = -100;
    [imageV setCenter:imageVpoint];
    [imageV setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGPoint userNametfPoint = userNametf.center;
    userNametfPoint.x = self.view.frame.size.width;
    [userNametf setCenter:userNametfPoint];
    [userNametf setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGPoint userNamePoint = userName.center;
    userNamePoint.x = -self.view.frame.size.width;
    [userName setCenter:userNamePoint];
    [userName setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGPoint passwordtfPoint = passWordtf.center;
    passwordtfPoint.x = -self.view.frame.size.width;
    [passWordtf setCenter:passwordtfPoint];
    [passWordtf setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGPoint passwordPoint = passWord.center;
    passwordPoint.x = self.view.frame.size.width;
    [passWord setCenter:passwordPoint];
    [passWord setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGPoint passwordtfAPoint = passWordtfAgain.center;
    passwordtfAPoint.x = self.view.frame.size.width/2;
    [passWordtfAgain setCenter:passwordtfAPoint];
    [passWordtfAgain setAlpha:1];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGPoint passwALabelPoint = passwalabel.center;
    passwALabelPoint.x = self.view.frame.size.width/2;
    [passwalabel setCenter:passwALabelPoint];
    [passwalabel setAlpha:1];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGPoint emailtfPoint = emailtf.center;
    emailtfPoint.x = self.view.frame.size.width;
    [emailtf setCenter:emailtfPoint];
    [emailtf setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGPoint emailPoint = email.center;
    emailPoint.x = -self.view.frame.size.width;
    [email setCenter:emailPoint];
    [email setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGPoint phoneNumbertfPoint = phoneNumbertf.center;
    phoneNumbertfPoint.x = -self.view.frame.size.width;
    [phoneNumbertf setCenter:phoneNumbertfPoint];
    [phoneNumbertf setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGPoint phoneNumberPoint = phoneNumber.center;
    phoneNumberPoint.x = self.view.frame.size.width;
    [phoneNumber setCenter:phoneNumberPoint];
    [phoneNumber setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGPoint defineButtonPoint = defineButton.center;
    defineButtonPoint.y = self.view.frame.size.height;
    [defineButton setCenter:defineButtonPoint];
    [defineButton setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    CGPoint cancelButtonPoint = cancelButton.center;
    cancelButtonPoint.x = self.view.frame.size.width+16;
    [cancelButton setCenter:cancelButtonPoint];
    [cancelButton setAlpha:0.0];
    [UIView commitAnimations];
    
}
//点击空白处收起键盘
-(void)pickKeyboardUp
{
    [bgsv endEditing:YES];
    //[bgsv resignFirstResponder];
}
-(void)canceling
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
-(void)defineing
{
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"注册成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
//    [alert show];
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
