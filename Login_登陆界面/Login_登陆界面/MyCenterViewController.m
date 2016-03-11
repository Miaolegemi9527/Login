//
//  MyCenterViewController.m
//  Login_登陆界面
//
//  Created by lanou on 15/11/17.
//  Copyright (c) 2015年 9527. All rights reserved.
//

#import "MyCenterViewController.h"

@interface MyCenterViewController ()

@end

@implementation MyCenterViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back)];
    tap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tap];
    
    //存储背景图片
    //获取documents文件夹的路径
    
    NSLog(@"%@",NSHomeDirectory());
    docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    //创建保存图片路径
    bgPicPath = [docPath stringByAppendingPathComponent:@"bgImage.png"];
    NSLog(@"pgPicPath2=%@",bgPicPath);
    //本地存储图片路径 供其他页面使用
    NSUserDefaults *de = [NSUserDefaults standardUserDefaults];
    [de setObject:bgPicPath forKey:@"bgPicPath"];
    //对文件的管理 使用文件管理者（文件的创建 移动 复制 删除等）NSFileManager也是单例模式
    manager = [NSFileManager defaultManager];
    //创建文件
    //先判断文件是不是已存在
    //可省略不写
    if ([manager fileExistsAtPath:bgPicPath]) {
        //文件存在
    }else
    {
        //文件不存在，则创建文件
        [manager createFileAtPath:bgPicPath contents:nil attributes:nil];
    }

    
//    CGRect screenBounds = [[UIScreen mainScreen]bounds];//返回的是带有状态栏的Rect
//    CGRect rect = [[UIScreen mainScreen] applicationFrame];//不包含状态栏的Rect
    
    bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //    bgView.backgroundColor = [UIColor whiteColor];
    bgView.contentMode = UIViewContentModeScaleAspectFit;
    bgView.userInteractionEnabled = YES;
    bgView.image = [UIImage imageWithContentsOfFile:bgPicPath];
    bgView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:bgView];

    
    //背景毛玻璃效果
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    //    [self.view addSubview:effectview];
    

//    UITextView *translationtv = [[UITextView alloc] initWithFrame:CGRectMake(30, 50, 315, 60)];
//    translationtv.layer.borderColor = [UIColor orangeColor].CGColor;
//    translationtv.layer.borderWidth = 1;
//    [self.view addSubview:translationtv];
//    
//    UIButton *translationButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    translationButton.frame = CGRectMake(285, 120, 60, 30);
//    translationButton.layer.borderColor = [UIColor orangeColor].CGColor;
//    translationButton.layer.borderWidth = 1;
//    [translationButton setTitle:@"翻译" forState:UIControlStateNormal];
//    [translationButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
//    [self.view addSubview:translationButton];
    
    
}



-(void)back
{
//    [self.view endEditing:YES];
    
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    effectview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [bgView addSubview:effectview];

    
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
