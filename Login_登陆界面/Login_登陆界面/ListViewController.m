//
//  ListViewController.m
//  Login_登陆界面
//
//  Created by lanou on 15/11/16.
//  Copyright (c) 2015年 9527. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    //背景毛玻璃效果
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.contentMode = UIViewContentModeScaleAspectFit;
    bgView.userInteractionEnabled = YES;
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//    [self.view addSubview:effectview];
    
    tab = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
//    tab.alpha = 0.5;
    tab.backgroundColor = [UIColor clearColor];
    //隐藏分割线
    tab.separatorStyle = UITableViewCellSelectionStyleNone;
    tab.dataSource = self;
    tab.delegate = self;
    [self.view addSubview:tab];
    
    mButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    mButton.backgroundColor = [UIColor clearColor];
    [mButton setTitle:@"M" forState:UIControlStateNormal];
    mButton.frame = CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height+48, 48, 48);//600
    mButton.center = CGPointMake(self.view.center.x, mButton.center.y);
    [mButton setImage:[UIImage imageNamed:@"touxiang2"] forState:UIControlStateNormal];
    [mButton setImage:[UIImage imageNamed:@"touxiang2"] forState:UIControlStateHighlighted];

//    mButton.center = CGPointMake(self.view.center.x, mButton.center.y);
    mButton.layer.cornerRadius = 24;
    mButton.layer.masksToBounds = YES;
    mButton.alpha = 0.0;
    [self.view addSubview:mButton];
    [mButton addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    
    settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    settingButton.frame = CGRectMake(self.view.frame.size.width, 610, 40, 40);
    settingButton.backgroundColor = [UIColor redColor];
    settingButton.layer.cornerRadius = 20;
    settingButton.layer.masksToBounds = YES;
    settingButton.alpha = 0.0;
    [settingButton setTitle:@"设置" forState:UIControlStateNormal];
    [self.view addSubview:settingButton];
    [settingButton addTarget:self action:@selector(settinging) forControlEvents:UIControlEventTouchUpInside];
    
    myCenter = [UIButton buttonWithType:UIButtonTypeCustom];
    myCenter.frame = CGRectMake(-40, 610, 40, 40);
    myCenter.layer.cornerRadius = 20;
    myCenter.layer.masksToBounds = YES;
    myCenter.alpha = 0.0;
    myCenter.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:myCenter];
    [myCenter addTarget:self action:@selector(mycenter) forControlEvents:UIControlEventTouchUpInside];
    
                     
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress)];
    longPress.minimumPressDuration = 0.4;
    longPress.allowableMovement = 50;
    [mButton addGestureRecognizer:longPress];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backing)];
    tap.numberOfTapsRequired = 1;
    [mButton addGestureRecognizer:tap];
    
    
    
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"listCell";
    ListTableViewCell *ListCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (ListCell == nil) {
        ListCell = [[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    ListCell.backgroundColor = [UIColor clearColor];
    return ListCell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 58;//58
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

//加载cell动画效果
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    CATransform3D rotation;
//    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
//    rotation.m34 = 1.0/ -600;
//    
//    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//    cell.layer.shadowOffset = CGSizeMake(10, 10);
//    cell.alpha = 0;
//    cell.layer.transform = rotation;
//    cell.layer.anchorPoint = CGPointMake(0, 0.5);
//    
//    
//    [UIView beginAnimations:@"rotation" context:NULL];
//    [UIView setAnimationDuration:0.8];
//    cell.layer.transform = CATransform3DIdentity;
//    cell.alpha = 1;
//    cell.layer.shadowOffset = CGSizeMake(0, 0);
//    [UIView commitAnimations];
//}


-(void)longPress
{
    [UIView animateWithDuration:1.5 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint myCenterPoint = myCenter.center;
        myCenterPoint.x = (self.view.center.x-24)/2;
        myCenterPoint.y = self.view.frame.size.height-5-24;
        [myCenter setCenter:myCenterPoint];
        myCenter.alpha = 1;
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:1.5 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint settingPoint = settingButton.center;
        settingPoint.x = self.view.frame.size.width-((self.view.center.x-24)/2);
        settingPoint.y = self.view.frame.size.height-5-24;
        [settingButton setCenter:settingPoint];
        settingButton.alpha = 1;
    } completion:^(BOOL finished) {
    }];
}
-(void)hide
{
    [UIView animateWithDuration:2.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint myCenterPoint = myCenter.center;
        myCenterPoint.x = -40;
        [myCenter setCenter:myCenterPoint];
        myCenter.alpha = 0.0;
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:2.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint settingPoint = settingButton.center;
        settingPoint.x = self.view.frame.size.width+20;
        [settingButton setCenter:settingPoint];
        settingButton.alpha = 0.0;
    } completion:^(BOOL finished) {
    }];

}
-(void)settinging
{
    SettingViewController *setView = [[SettingViewController alloc] init];
    setView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:setView animated:YES completion:^{
        
    }];
}
-(void)mycenter
{
    MyCenterViewController *myCenterView = [[MyCenterViewController alloc] init];
    myCenterView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:myCenterView animated:YES completion:^{
        
    }];
}


-(void)viewWillAppear:(BOOL)animated
{
//    [UIView animateWithDuration:2 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        CGPoint mButtonPoint = mButton.center;
//        mButtonPoint.y = 600;
//        [mButton setCenter:mButtonPoint];
//    } completion:^(BOOL finished) {
//        
//    }];
    
    [effectview.contentView addSubview:tab];

}
-(void)viewDidAppear:(BOOL)animated
{
    //cell
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:2];
//    CGPoint tabPoint = tab.center;
//    tabPoint.x = self.view.center.x;
//    tabPoint.y = self.view.center.y+20;//+20
//    [tab setCenter:tabPoint];
//    tab.alpha = 1;
//    [UIView commitAnimations];
    
//    [UIView animateWithDuration:2 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        CGPoint tabPoint = tab.center;
//        tabPoint.x = self.view.center.x;
//        tabPoint.y = self.view.center.y-30;
//        [tab setCenter:tabPoint];
//    } completion:^(BOOL finished) {
//        
//    }];
    
    [UIView animateWithDuration:6 delay:0.0 usingSpringWithDamping:1 initialSpringVelocity:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint mButtonPoint = mButton.center;
        mButtonPoint.y = self.view.frame.size.height-5-24;//637/630
        [mButton setCenter:mButtonPoint];
        mButton.alpha = 0.9;
    } completion:^(BOOL finished) {
        
    }];
}

-(void)viewDidDisappear:(BOOL)animated
{
    
}
-(void)backing
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
