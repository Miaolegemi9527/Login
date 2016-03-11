//
//  RootViewController.m
//  Login_登陆界面
//
//  Created by lanou on 15/11/12.
//  Copyright (c) 2015年 9527. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@property(nonatomic,strong)CAGradientLayer *gradientLayer;
@property(nonatomic,strong)NSTimer *timer;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置背景图片
    //方式1 名字
//    UIImage *bgImage = [UIImage imageNamed:@"backgroundImage.jpg"];
    //方式2 路径
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"backgroundImage" ofType:@"jpg"];
//    UIImage *bgImage = [UIImage imageWithContentsOfFile:path];
    
//    UIColor *color =[UIColor colorWithPatternImage:bgImage];
//    self.view.backgroundColor =color;
    
    //方式3
//    self.view.layer.contents = (id)[UIImage imageNamed:@"backgroundImage.jpg"].CGImage;
    
    //方式4
//    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    bgImageView.image = [UIImage imageNamed:@"backgroundImage.jpg"];
//    [self.view addSubview:bgImageView];
    
//    self.view.backgroundColor = [UIColor colorWithRed:214/255.0 green:248/255.0 blue:127/255.0 alpha:0.8];//淡绿
//    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:242/255.0 blue:223/255.0 alpha:0.8];//淡棕色
//    self.view.backgroundColor = [UIColor colorWithRed:186/255.0 green:250/255.0 blue:201/255.0 alpha:0.8];
    
    //把保存的图片设置成背景图片
//    NSUserDefaults *de = [NSUserDefaults standardUserDefaults];
//    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    bgImageView.image = [UIImage imageWithContentsOfFile:[de objectForKey:@"bgPicPath"]];
//    NSLog(@"pgPicPath1=%@",[de objectForKey:@"bgPicPath"]);
//    bgImageView.contentMode = UIViewContentModeScaleToFill;
//    [self.view addSubview:bgImageView];
    
    //初始化 实例化
    de = [NSUserDefaults standardUserDefaults];
    
    //登陆竖排文字 登陆
    //创建闪烁视图
    loginShanshuoView = [[FBShimmeringView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:loginShanshuoView];
    
    verticalLabel = [[UILabel alloc] initWithFrame:loginShanshuoView.bounds];
    verticalLabel.center = CGPointMake(self.view.center.x, verticalLabel.center.y);
    verticalLabel.transform = CGAffineTransformMakeRotation(M_PI/2);
    verticalLabel.text = NSLocalizedString(@"LOGIN", nil);
    verticalLabel.font = [UIFont boldSystemFontOfSize:18];
    verticalLabel.textAlignment = NSTextAlignmentCenter;
    loginShanshuoView.contentView = verticalLabel;
    loginShanshuoView.shimmering = YES;
    verticalLabel.alpha = 0.0;
    
    //背景毛玻璃效果
//        bgImageView.contentMode = UIViewContentModeScaleAspectFit;
//        bgImageView.userInteractionEnabled = YES;
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
        effectview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        //[self.view addSubview:effectview];
        //[effectview.contentView addSubview:imageV];//虚化后imageV不受影响
    
    
    //头像
    imageV = [[UIImageView alloc] initWithFrame:CGRectMake(100, -100, 100, 100)];
    imageV.center = CGPointMake(self.view.center.x, imageV.center.y);
    imageV.backgroundColor = [UIColor orangeColor];
    imageV.image = [UIImage imageNamed:@"touxiang1"];
    imageV.layer.cornerRadius = 50;
    imageV.layer.masksToBounds = YES;
    imageV.alpha = 0.0;
    [self.view addSubview:imageV];
    
    
    //注册
    registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    registerButton.backgroundColor = [UIColor orangeColor];
    registerButton.backgroundColor = [UIColor orangeColor];
    registerButton.frame = CGRectMake(210, -50, 50, 50);//y=60
    registerButton.layer.cornerRadius = 25;
    registerButton.layer.masksToBounds = YES;
    registerButton.alpha = 0;
//    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(registering) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    //登陆竖排文字 注册
    registervl = [[UILabel alloc] initWithFrame:CGRectMake(210, -100, 50, 50)];
    registervl.center = CGPointMake(registerButton.center.x, registervl.center.y);
//    registervl.backgroundColor = [UIColor orangeColor];
//    registervl.transform = CGAffineTransformMakeRotation(M_PI/2);
    registervl.text = @"注\n册";
    registervl.font = [UIFont boldSystemFontOfSize:16];
    registervl.textAlignment = NSTextAlignmentCenter;
    registervl.alpha = 0.0;
    registervl.numberOfLines = [registervl.text length];
    [self.view addSubview:registervl];

    
    //找回密码
    findPassWordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    findPassWordButton.backgroundColor = [UIColor purpleColor];
    findPassWordButton.frame = CGRectMake(self.view.frame.size.width, 115, 32, 32);//x=241
    findPassWordButton.layer.cornerRadius = 16;
    findPassWordButton.titleLabel.font = [UIFont systemFontOfSize:14];//修改button字体
    findPassWordButton.layer.masksToBounds = YES;
    findPassWordButton.alpha = 0;
//    [findPassWordButton setTitle:@"密码" forState:UIControlStateNormal];
    [findPassWordButton addTarget:self action:@selector(findPasswordBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:findPassWordButton];
    //登陆竖排文字 找回密码
    findPassWordvl = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width+32, 115, 32, 32)];
    findPassWordvl.center = CGPointMake(findPassWordvl.center.x, findPassWordvl.center.y);
    //    registervl.backgroundColor = [UIColor orangeColor];
    //    registervl.transform = CGAffineTransformMakeRotation(M_PI/2);
    findPassWordvl.text = @"密\n码";
    findPassWordvl.font = [UIFont boldSystemFontOfSize:12];
    findPassWordvl.textAlignment = NSTextAlignmentCenter;
    findPassWordvl.alpha = 0.0;
    findPassWordvl.numberOfLines = [findPassWordvl.text length];
    [self.view addSubview:findPassWordvl];
    //动态
//    imageHeadMove = [[UIImageView alloc] initWithFrame:CGRectMake(215, 75, 40, 40)];
//    imageHeadMove.center = CGPointMake(self.view.center.x, imageHeadMove.center.y);
//    imageHeadMove.backgroundColor = [UIColor colorWithRed:194/255.0 green:174/255.0 blue:108/255.0 alpha:0.8];
//    imageHeadMove.layer.cornerRadius = 20;
//    imageHeadMove.layer.masksToBounds = YES;
//    imageHeadMove.image = [UIImage imageNamed:@"tired_0"];
//    NSMutableArray *imageHeadMoveImageArray =[NSMutableArray array];
//    for (int i = 0; i < 12; i++) {
//        NSString *imageHeadMoveImageName = [NSString stringWithFormat:@"tired_%d",i];
//        UIImage *imageHeadMoveImage = [UIImage imageNamed:imageHeadMoveImageName];
//        [imageHeadMoveImageArray addObject:imageHeadMoveImage];
//    }
//    imageHeadMove.animationImages = imageHeadMoveImageArray;
//    imageHeadMove.animationDuration = 2;
//    imageHeadMove.animationRepeatCount = 0;
//    [imageHeadMove startAnimating];
//    [self.view addSubview:imageHeadMove];
    //用户名
    
    useNametf = [[UITextField alloc] initWithFrame:CGRectMake(-self.view.frame.size.width, 240, self.view.frame.size.width, 30)];
//    useNametf.backgroundColor = [UIColor colorWithRed:194/255.0 green:174/255.0 blue:108/255.0 alpha:0.8];
//    useNametf.alpha = 0.0;
    useNametf.textAlignment = NSTextAlignmentCenter;
//    useNametf.placeholder = @"userName";
    UIColor *namePlaceholderColor = [UIColor orangeColor];
    useNametf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"userName" attributes:@{NSForegroundColorAttributeName:namePlaceholderColor}];
    useNametf.textColor = [UIColor colorWithRed:141/255.0 green:106/255.0 blue:71/255.0 alpha:1];
//    useNametf.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:useNametf];
    userLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 270, 275, 1)];
    userLabel.backgroundColor = [UIColor colorWithRed:194/255.0 green:174/255.0 blue:108/255.0 alpha:0.8];
//    userLabel.alpha = 0.0;
    [self.view addSubview:userLabel];
    //密码
    passWordtf = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 280, self.view.frame.size.width, 30)];
//    passWordtf.backgroundColor = [UIColor colorWithRed:194/255.0 green:174/255.0 blue:108/255.0 alpha:0.8];
//    passWordtf.alpha = 0.0;
    passWordtf.textAlignment = NSTextAlignmentCenter;
//    passWordtf.placeholder = @"passWord";
    UIColor *passWordPlaceholderColor = [UIColor orangeColor];
    passWordtf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"passWord" attributes:@{NSForegroundColorAttributeName:passWordPlaceholderColor}];
    passWordtf.textColor = [UIColor colorWithRed:141/255.0 green:106/255.0 blue:71/255.0 alpha:1];
    passWordtf.secureTextEntry = YES;
//    passWordtf.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:passWordtf];
    passWordLabel = [[UILabel alloc] initWithFrame:CGRectMake(-self.view.frame.size.width, 310, 275, 1)];
    passWordLabel.backgroundColor = [UIColor colorWithRed:194/255.0 green:174/255.0 blue:108/255.0 alpha:0.8];
//    passWordLabel.alpha = 0.0;
    [self.view addSubview:passWordLabel];
    //登陆
    loginButoon = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButoon.frame = CGRectMake(0, self.view.frame.size.height, 50, 50);//380
    loginButoon.center = CGPointMake(self.view.center.x, loginButoon.center.y);
    loginButoon.layer.cornerRadius = 25;
    loginButoon.layer.masksToBounds = YES;
    loginButoon.alpha = 0.0;
    loginButoon.backgroundColor = [UIColor colorWithRed:194/255.0 green:174/255.0 blue:108/255.0 alpha:0.9];
//    loginButoon.backgroundColor = [UIColor clearColor];
    
//    loginButoon.backgroundColor = [UIColor colorWithRed:122/255.0 green:98/255.0 blue:74/255.0 alpha:1];
//    [loginButoon setTitle:@"登陆" forState:UIControlStateNormal];
//    [loginButoon setTitleColor:[UIColor colorWithRed:122/255.0 green:98/255.0 blue:74/255.0 alpha:0.8] forState:UIControlStateNormal];//修改button字体颜色
//    [loginButoon setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [loginButoon addTarget:self action:@selector(logining) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButoon];
    
    

//    verticalLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, self.view.frame.size.height+70, 70, 50)];
//    verticalLabel.center = CGPointMake(self.view.center.x, verticalLabel.center.y);
////    verticalLabel.backgroundColor = [UIColor orangeColor];
//    verticalLabel.transform = CGAffineTransformMakeRotation(M_PI/2);
//    verticalLabel.text = @"LOGIN";
//    verticalLabel.font = [UIFont boldSystemFontOfSize:18];
//    verticalLabel.textAlignment = NSTextAlignmentCenter;
//    verticalLabel.alpha = 0.0;
////    verticalLabel.numberOfLines = [verticalLabel.text length];
//    [self.view addSubview:verticalLabel];
    
    //添加手势 点击头像触发 注册 找回密码
    UITapGestureRecognizer *imageVtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(registerFindPassWord)];
    //设置点击次数
    imageVtap.numberOfTapsRequired = 1;
    imageV.userInteractionEnabled = YES;
    [imageV addGestureRecognizer:imageVtap];
    
    //点击空白隐藏按钮
    UITapGestureRecognizer *hidButtonTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidden)];
    hidButtonTap.numberOfTapsRequired = 1;
    //加上这句不会影响tableview 上的 action (button,cell selected...)
    //hidButtonTap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:hidButtonTap];
    
    
    
    
    
}


//点击空白隐藏按钮
-(void)hidden{
    
    //[self.view endEditing:YES];
    //收起顶部提示通知
    [[NSNotificationCenter defaultCenter] postNotificationName:RKDropdownAlertDismissAllNotification object:nil];
    [de removeObjectForKey:@"clickImageV"];
    
    [UIView animateWithDuration:2.0 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:3.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint registerButtonPoint = registerButton.center;
        registerButtonPoint.y = -25;
        [registerButton setCenter:registerButtonPoint];
        [registerButton setAlpha:0.0];
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:3.0 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint registervlPoint = registervl.center;
        registervlPoint.y = -75;
        [registervl setCenter:registervlPoint];
        [registervl setAlpha:0.0];
    } completion:^(BOOL finished) {
    }];
    
    
    [UIView animateWithDuration:2.0 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:1.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint findpwButtonPoint = findPassWordButton.center;
        findpwButtonPoint.x = self.view.frame.size.width+16;
        [findPassWordButton setCenter:findpwButtonPoint];
        [findPassWordButton setAlpha:0.0];
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:3.0 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint findPassWordvlPoint = findPassWordvl.center;
        findPassWordvlPoint.x = self.view.frame.size.width+16;
        [findPassWordvl setCenter:findPassWordvlPoint];
        [findPassWordvl setAlpha:0.0];
    } completion:^(BOOL finished) {
    }];

    

    
    
//    CATransition *animation = [CATransition animation];
//    animation.type = kCATransitionFade;
//    animation.duration = 0.4;
//    [registerButton.layer addAnimation:animation forKey:nil];
//    [findPassWordButton.layer addAnimation:animation forKey:nil];
//    registerButton.hidden = hid;
//    findPassWordButton.hidden = hid;
//    hid = !hid;
}


-(void)viewWillAppear:(BOOL)animated
{
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:2.5];
//    CGPoint imageVpoint = imageV.center;
//    imageVpoint.y = 150;
//    [imageV setCenter:imageVpoint];
//    [imageV setAlpha:0.7];
//    [UIView commitAnimations];
    
    //移除点击头像 记录一次 注册/密码 动态效果使用到
    [de removeObjectForKey:@"clickImageV"];
    
    [UIView animateWithDuration:5.0 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint imageVpoint = imageV.center;
        imageVpoint.y = 150;
        [imageV setCenter:imageVpoint];
        [imageV setAlpha:0.9];//0.7
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:3.0 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGPoint useNametfPoint = useNametf.center;
            useNametfPoint.x = self.view.frame.size.width/2;
            [useNametf setCenter:useNametfPoint];
            [useNametf setAlpha:1];//0.8
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:3.0 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGPoint userlabelPoint = userLabel.center;
            userlabelPoint.x = self.view.frame.size.width/2;
            [userLabel setCenter:userlabelPoint];
            [userLabel setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:3.5 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGPoint passwordtfPoint = passWordtf.center;
            passwordtfPoint.x = self.view.frame.size.width/2;
            [passWordtf setCenter:passwordtfPoint];
            [passWordtf setAlpha:1];//0.8
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:3.5 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGPoint passwordlabelPoint = passWordLabel.center;
            passwordlabelPoint.x = self.view.frame.size.width/2;
            [passWordLabel setCenter:passwordlabelPoint];
            [passWordLabel setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:5.0 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint loginButoonPoint = imageV.center;
        loginButoonPoint.y = 405;
        [loginButoon setCenter:loginButoonPoint];
        [loginButoon setAlpha:0.7];//0.5
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:5.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint verticalLabelPoint = verticalLabel.center;
        verticalLabelPoint.y = 475;
        [verticalLabel setCenter:verticalLabelPoint];
        [verticalLabel setAlpha:0.7];//0.5
    } completion:^(BOOL finished) {
        
    }];

}

-(void)viewDidAppear:(BOOL)animated
{
 
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
    [UIView setAnimationDuration:0.4];
    CGPoint loginButoonPoint = imageV.center;
    loginButoonPoint.y = self.view.frame.size.height;
    [loginButoon setCenter:loginButoonPoint];
    [loginButoon setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint verticalLabelPoint = verticalLabel.center;
        verticalLabelPoint.y = self.view.frame.size.height+110;
        [verticalLabel setCenter:verticalLabelPoint];
        [verticalLabel setAlpha:0.0];//0.5
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGPoint useNametfPoint = useNametf.center;
    useNametfPoint.x = self.view.frame.size.width;
    [useNametf setCenter:useNametfPoint];
    [useNametf setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGPoint userlabelPoint = userLabel.center;
    userlabelPoint.x = -self.view.frame.size.width;
    [userLabel setCenter:userlabelPoint];
    [userLabel setAlpha:0.0];
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
    CGPoint passwordlabelPoint = passWordLabel.center;
    passwordlabelPoint.x = self.view.frame.size.width;
    [passWordLabel setCenter:passwordlabelPoint];
    [passWordLabel setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    CGPoint registerButtonPoint = registerButton.center;
    registerButtonPoint.y = -25;
    [registerButton setCenter:registerButtonPoint];
    [registerButton setAlpha:0.0];
    [UIView commitAnimations];
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2];
    CGPoint registervlPoint = registervl.center;
    registervlPoint.y = -75;
    [registervl setCenter:registervlPoint];
    [registervl setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGPoint findpwButtonPoint = findPassWordButton.center;
    findpwButtonPoint.x = self.view.frame.size.width+16;
    [findPassWordButton setCenter:findpwButtonPoint];
    [findPassWordButton setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGPoint findPassWordvlPoint = findPassWordvl.center;
    findPassWordvlPoint.x = self.view.frame.size.width+16;
    [findPassWordvl setCenter:findPassWordvlPoint];
    [findPassWordvl setAlpha:0.0];
    [UIView commitAnimations];
    
}





-(void)registering
{
    RegistrViewController *registerV = [[RegistrViewController alloc] init];
    registerV.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:registerV animated:YES completion:^{
        
    }];
}

-(void)registerFindPassWord
{
    
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1.5];
//    CGPoint registerButtonPoint = registerButton.center;
//    registerButtonPoint.y = 85;
//    [registerButton setCenter:registerButtonPoint];
//    [registerButton setAlpha:0.6];
//    [UIView commitAnimations];
    
    //点击头像 记录一次 注册/密码 动态效果使用到
    [de setObject:@"1" forKey:@"clickImageV"];
    
    [UIView animateWithDuration:1.5 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:1.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGPoint registerButtonPoint = registerButton.center;
        registerButtonPoint.y = 85;
        [registerButton setCenter:registerButtonPoint];
        [registerButton setAlpha:0.5];
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:2.0 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint registervlPoint = registervl.center;
        registervlPoint.y = registerButton.center.y;
        registervlPoint.x = registerButton.center.x;
        [registervl setCenter:registervlPoint];
        [registervl setAlpha:0.5];
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:2.0 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:1.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGPoint findpwButtonPoint = findPassWordButton.center;
            findpwButtonPoint.x = 257;
            [findPassWordButton setCenter:findpwButtonPoint];
            [findPassWordButton setAlpha:0.5];
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:2.0 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint findPassWordvlPoint = findPassWordvl.center;
        findPassWordvlPoint.y = findPassWordButton.center.y;
        findPassWordvlPoint.x = findPassWordButton.center.x;
        [findPassWordvl setCenter:findPassWordvlPoint];
        [findPassWordvl setAlpha:0.5];
    } completion:^(BOOL finished) {
    }];
    
}
//顶部提示碰到小球
-(void)peng
{
    [UIView animateWithDuration:2.2 delay:0.044 usingSpringWithDamping:0.5 initialSpringVelocity:7 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint registerButtonPoint = registerButton.center;
        registerButtonPoint.x = 257;
        registerButtonPoint.y = 111;
        [registerButton setCenter:registerButtonPoint];
        [registerButton setAlpha:0.4];
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:2.2 delay:0.08 usingSpringWithDamping:0.4 initialSpringVelocity:6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        registervl.transform = CGAffineTransformRotate(registervl.transform, M_PI/2);//M_PI/2
        
        CGPoint registervlPoint = registervl.center;
        registervlPoint.y = registerButton.center.y;//registerButton.center.y
        registervlPoint.x = registerButton.center.x;//registerButton.center.x
        [registervl setCenter:registervlPoint];
        [registervl setAlpha:0.4];
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:2.2 delay:0.08 usingSpringWithDamping:0.7 initialSpringVelocity:11 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint findpwButtonPoint = findPassWordButton.center;
        findpwButtonPoint.x = 293;//257
        [findPassWordButton setCenter:findpwButtonPoint];
        [findPassWordButton setAlpha:0.4];
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:2.2 delay:0.13 usingSpringWithDamping:0.7 initialSpringVelocity:11 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        findPassWordvl.transform = CGAffineTransformRotate(findPassWordvl.transform, M_PI);//M_PI
        
        CGPoint findPassWordvlPoint = findPassWordvl.center;
        findPassWordvlPoint.y = findPassWordButton.center.y;
        findPassWordvlPoint.x = findPassWordButton.center.x;
        [findPassWordvl setCenter:findPassWordvlPoint];
        [findPassWordvl setAlpha:0.4];
    } completion:^(BOOL finished) {
    }];
}
-(void)pengBack
{
    [de setObject:@"1" forKey:@"clickImageV"];
    
    [UIView animateWithDuration:1 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:7 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint registerButtonPoint = registerButton.center;
        registerButtonPoint.x = 235;
        registerButtonPoint.y = 85;
        [registerButton setCenter:registerButtonPoint];
        [registerButton setAlpha:0.5];
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:1.2 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        registervl.transform = CGAffineTransformMakeRotation(0);//M_PI*2
        
        CGPoint registervlPoint = registervl.center;
        registervlPoint.y = registerButton.center.y;
        registervlPoint.x = registerButton.center.x;
        [registervl setCenter:registervlPoint];
        [registervl setAlpha:0.5];
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:1.4 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint findpwButtonPoint = findPassWordButton.center;
        findpwButtonPoint.x = 257;
        [findPassWordButton setCenter:findpwButtonPoint];
        [findPassWordButton setAlpha:0.5];
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:1.6 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:4 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        findPassWordvl.transform = CGAffineTransformMakeRotation(0);
        
        CGPoint findPassWordvlPoint = findPassWordvl.center;
        findPassWordvlPoint.y = findPassWordButton.center.y;
        findPassWordvlPoint.x = findPassWordButton.center.x;
        [findPassWordvl setCenter:findPassWordvlPoint];
        [findPassWordvl setAlpha:0.5];
    } completion:^(BOOL finished) {
    }];
}
//找回密码
-(void)findPasswordBack
{
    FindPasswordBackViewController *fbp = [[FindPasswordBackViewController alloc] init];
    fbp.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:fbp animated:YES completion:^{
        
    }];
}

//点击空白处收起键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//登陆
-(void)logining
{
    //点击登录收起键盘
    [self.view endEditing:YES];
    
    
    if ((useNametf.text).length == 0 && (passWordtf.text).length == 0) {
        [RKDropdownAlert title:@"友情提示" message:@"请输入用户名和密码" backgroundColor:nil textColor:nil time:1.9];
        
        
        if ([[de objectForKey:@"clickImageV"] isEqualToString:@"1"]) {
            //每点击一次就重新计时一次
            if (self.timer) {
                [self.timer invalidate];
                self.timer = nil;
            }
            
            self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(peng) userInfo:nil repeats:NO];
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.4 target:self selector:@selector(pengBack) userInfo:nil repeats:NO];
        }else
        {
            
        }
        
        
        
    }
    else
    {
        //ListViewController *listV = [[ListViewController alloc] init];
        ViewController *view = [[ViewController alloc] init];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:view];
        nav.navigationBar.barTintColor = [UIColor whiteColor];
        nav.navigationBar.translucent = NO;
        view.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:^{
        }];
        
       
        
        //背景虚化
        //[self.view addSubview:effectview];
        //imageV不受影响
        //[effectview.contentView addSubview:imageV];
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
        //self.timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(changeColor) userInfo:nil repeats:YES];
        
    }//
}

//颜色渐变
-(void)changeColor
{
    //定时改变颜色

    self.gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,(__bridge id)[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0].CGColor];
    //定时改变分割点
    self.gradientLayer.locations = @[@(arc4random()%10/10.0f),@(1.0f)];
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
