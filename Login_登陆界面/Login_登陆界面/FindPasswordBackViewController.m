//
//  FindPasswordBackViewController.m
//  Login_登陆界面
//
//  Created by lanou on 15/11/14.
//  Copyright (c) 2015年 9527. All rights reserved.
//

#import "FindPasswordBackViewController.h"

@interface FindPasswordBackViewController ()

@end

@implementation FindPasswordBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    bgView.image = [UIImage imageNamed:@"foru.jpg"];
//    [self.view addSubview:bgView];
    
    //头像
    imageV = [[UIImageView alloc] initWithFrame:CGRectMake(100, -100, 100, 100)];
    imageV.center = CGPointMake(self.view.center.x, imageV.center.y);
    imageV.backgroundColor = [UIColor orangeColor];
    imageV.image = [UIImage imageNamed:@"touxiang3"];
    imageV.layer.cornerRadius = 50;
    imageV.layer.masksToBounds = YES;
    imageV.alpha = 0.0;
    [self.view addSubview:imageV];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(-self.view.frame.size.width, 240, self.view.frame.size.width, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"密码找回";
    label.textColor = [UIColor grayColor];
    label.font = [UIFont boldSystemFontOfSize:18];
    [self.view addSubview:label];
    LabelB = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 270, 275, 1)];
    LabelB.backgroundColor = [UIColor colorWithRed:194/255.0 green:174/255.0 blue:108/255.0 alpha:0.8];
    [self.view addSubview:LabelB];
    //密码
    numbertf = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 280, self.view.frame.size.width, 30)];
    numbertf.textAlignment = NSTextAlignmentCenter;
    UIColor *passWordPlaceholderColor = [UIColor grayColor];
    numbertf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入账号/手机/邮箱" attributes:@{NSForegroundColorAttributeName:passWordPlaceholderColor}];
    numbertf.textColor = [UIColor grayColor];
    [self.view addSubview:numbertf];
    numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(-self.view.frame.size.width, 310, 275, 1)];
    numberLabel.backgroundColor = [UIColor colorWithRed:194/255.0 green:174/255.0 blue:108/255.0 alpha:0.8];
    [self.view addSubview:numberLabel];
    
    confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmButton.frame = CGRectMake(0, self.view.frame.size.height, 50, 50);//380
    confirmButton.center = CGPointMake(self.view.center.x, confirmButton.center.y);
    confirmButton.layer.cornerRadius = 25;
    confirmButton.layer.masksToBounds = YES;
    confirmButton.alpha = 0.0;
    confirmButton.backgroundColor = [UIColor colorWithRed:122/255.0 green:98/255.0 blue:74/255.0 alpha:0.7];
//    [confirmButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.view addSubview:confirmButton];
    
    yesVLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, 50, 50)];
    yesVLabel.center = CGPointMake(self.view.center.x, yesVLabel.center.y);
    yesVLabel.font = [UIFont boldSystemFontOfSize:18];
    yesVLabel.text = @"YES";
    yesVLabel.alpha = 0.0;
    yesVLabel.transform = CGAffineTransformMakeRotation(M_PI/2);
    [self.view addSubview:yesVLabel];
    
    
    
    //动态
//    imageHeadMove = [[UIImageView alloc] initWithFrame:CGRectMake(215, 540, 100, 100)];
//    imageHeadMove.center = CGPointMake(self.view.center.x, imageHeadMove.center.y);
//    imageHeadMove.backgroundColor = [UIColor clearColor];
//    imageHeadMove.alpha = 0.0;
//    imageHeadMove.image = [UIImage imageNamed:@"sb_0.tiff"];
//    NSMutableArray *imageHeadMoveImageArray =[NSMutableArray array];
//    for (int i = 0; i < 9; i++) {
//        NSString *imageHeadMoveImageName = [NSString stringWithFormat:@"sb_%d.tiff",i];
//        UIImage *imageHeadMoveImage = [UIImage imageNamed:imageHeadMoveImageName];
//        [imageHeadMoveImageArray addObject:imageHeadMoveImage];
//    }
//    imageHeadMove.animationImages = imageHeadMoveImageArray;
//    imageHeadMove.animationDuration = 1.4;
//    imageHeadMove.animationRepeatCount = 0;
//    [imageHeadMove startAnimating];
//    [self.view addSubview:imageHeadMove];
    
    
    
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
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:8.0];
    imageHeadMove.alpha = 1;
    [UIView commitAnimations];
    
    [UIView animateWithDuration:5.0 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint imageVpoint = imageV.center;
        imageVpoint.y = 150;
        [imageV setCenter:imageVpoint];
        [imageV setAlpha:0.9];//0.7
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:3.0 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint labelPoint = label.center;
        labelPoint.x = self.view.frame.size.width/2;
        [label setCenter:labelPoint];
        [label setAlpha:1];//0.8
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:3.0 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint labelBPoint = LabelB.center;
        labelBPoint.x = self.view.frame.size.width/2;
        [LabelB setCenter:labelBPoint];
        [LabelB setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:3.5 delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint numbertfPoint = numbertf.center;
        numbertfPoint.x = self.view.frame.size.width/2;
        [numbertf setCenter:numbertfPoint];
        [numbertf setAlpha:1];//0.8
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:3.5 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint numberLabelPoint = numberLabel.center;
        numberLabelPoint.x = self.view.frame.size.width/2;
        [numberLabel setCenter:numberLabelPoint];
        [numberLabel setAlpha:1];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:5.0 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint confirmButtonPoint = confirmButton.center;
        confirmButtonPoint.y = 405;
        [confirmButton setCenter:confirmButtonPoint];
        [confirmButton setAlpha:0.7];//0.5
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:7.0 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint yesVLabelPoint = yesVLabel.center;
        yesVLabelPoint.y = 475;
        [yesVLabel setCenter:yesVLabelPoint];
        [yesVLabel setAlpha:0.7];//0.5
    } completion:^(BOOL finished) {
    }];
    
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
    CGPoint labelPoint = label.center;
    labelPoint.x = self.view.frame.size.width;
    [label setCenter:labelPoint];
    [label setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGPoint LabelBPoint = LabelB.center;
    LabelBPoint.x = -self.view.frame.size.width;
    [LabelB setCenter:LabelBPoint];
    [LabelB setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGPoint numbertfPoint = numbertf.center;
    numbertfPoint.x = -self.view.frame.size.width;
    [numbertf setCenter:numbertfPoint];
    [numbertf setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    CGPoint numberLabelPoint = numberLabel.center;
    numberLabelPoint.x = self.view.frame.size.width;
    [numberLabel setCenter:numberLabelPoint];
    [numberLabel setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    CGPoint confirmButtonPoint = imageV.center;
    confirmButtonPoint.y = self.view.frame.size.height;
    [confirmButton setCenter:confirmButtonPoint];
    [confirmButton setAlpha:0.0];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    CGPoint yesVLabelPoint = yesVLabel.center;
    yesVLabelPoint.y = self.view.frame.size.height+75;
    [yesVLabel setCenter:yesVLabelPoint];
    [yesVLabel setAlpha:0.0];
    [UIView commitAnimations];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
