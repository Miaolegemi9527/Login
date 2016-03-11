//
//  ViewController.m
//  Login_登陆界面
//
//  Created by lanou on 15/11/29.
//  Copyright (c) 2015年 9527. All rights reserved.
//

#import "ViewController.h"
#import "DCPathButton.h"

@interface ViewController ()<DCPathButtonDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"小Q";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    UITableView *userTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    userTab.dataSource = self;
    userTab.delegate = self;
    //隐藏右侧指示器
    userTab.showsVerticalScrollIndicator = NO;
    //UITableView去掉底部多余的表格线
    [userTab setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    //UITableView去掉底部全部的表格线
    userTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    //UITableView底部表格线距离左边60
    //[userTab setSeparatorInset:UIEdgeInsetsMake(0, 60, 0, 0)];
    [self.view addSubview:userTab];
    
    //分区总数组
    dataArray = [NSMutableArray array];
    //创建各个分区的数组
    
    
    
    [self configureDCPathButton];
}

//1返回cell个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
//2返回每行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //在heightForRowAtIndexPath代理里面实现//选中状态返回的高度

    return 45;
}
//3请求数据元代理为tableView插入需要的cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"userCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.textLabel.text = @"小学一年级";
    cell.detailTextLabel.text = @"断罪小学";
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
//4监听点击的cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //需要声明一个全局BOOL变量isOpen，记录当前cell的状态，声明一个NSInterge类型selectedIndex，记录选择的cell的row。
    //NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    //判断选中不同row状态时候
    
    
}

-(void)configureDCPathButton
{
    // Configure center button
    //
    DCPathButton *centerButton = [[DCPathButton alloc] initWithCenterImage:[UIImage imageNamed:@"chooser-button-tab"] highlightedImage:[UIImage imageNamed:@"chooser-button-tab-highlighted"]];
    //签协议
    centerButton.delegate = self;
    
    // Configure item buttons
    //
    DCPathItemButton *itemButton_1 = [[DCPathItemButton alloc] initWithImage:[UIImage imageNamed:@"chooser-moment-icon-music"] highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"] backgroundImage:[UIImage imageNamed:@"chooser-moment-button"] backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_2 = [[DCPathItemButton alloc] initWithImage:[UIImage imageNamed:@"chooser-moment-icon-place"] highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-place-highlighted"] backgroundImage:[UIImage imageNamed:@"chooser-moment-button"] backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_3 = [[DCPathItemButton alloc] initWithImage:[UIImage imageNamed:@"chooser-moment-icon-camera"] highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-camera-highlighted"] backgroundImage:[UIImage imageNamed:@"chooser-moment-button"] backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_4 = [[DCPathItemButton alloc] initWithImage:[UIImage imageNamed:@"chooser-moment-icon-thought"] highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-thought-highlighted"] backgroundImage:[UIImage imageNamed:@"chooser-moment-button"] backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_5 = [[DCPathItemButton alloc] initWithImage:[UIImage imageNamed:@"chooser-moment-icon-sleep"] highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-sleep-highlighted"] backgroundImage:[UIImage imageNamed:@"chooser-moment-button"] backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    // Add the item button into the center button
    //
    [centerButton addPathItems:@[itemButton_1,
                                 itemButton_2,
                                 itemButton_3,
                                 itemButton_4,
                                 itemButton_5]];
    // Change the bloom radius, default is 105.0f
    //
    centerButton.bloomRadius = 120.0f;
    // Change the DCButton's center
    //
    centerButton.dcButtonCenter = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height - 25.5f);
    // Setting the DCButton appearance
    //
    centerButton.allowSounds = YES;
    centerButton.allowCenterButtonRotation = YES;
    centerButton.bottomViewColor = [UIColor grayColor];
    
    //中间按钮在左边下角 面向右边
    //    centerButton.bloomDirection = kDCPathButtonBloomDirectionTopRight;
    //    centerButton.dcButtonCenter = CGPointMake(10 + centerButton.frame.size.width/2, self.view.frame.size.height - centerButton.frame.size.height/2 - 10);
    
    //中间按钮在右下角 面向左边
    //    centerButton.bloomDirection = kDCPathButtonBloomDirectionTopLeft;
    //    centerButton.dcButtonCenter = CGPointMake(self.view.frame.size.width-centerButton.frame.size.width/2-10, self.view.frame.size.height-centerButton.frame.size.height/2-10);
    
    //中间按钮在中间 面向上
    centerButton.bloomDirection = kDCPathButtonBloomDirectionTop;
    centerButton.dcButtonCenter = CGPointMake(self.view.center.x, self.view.frame.size.height-centerButton.frame.size.height/2-64-10);
    
    
    centerButton.bottomViewColor = [UIColor redColor];
    [self.view addSubview:centerButton];
}
#pragma mark - DCPathButton Delegate
- (void)willPresentDCPathButtonItems:(DCPathButton *)dcPathButton
{
    NSLog(@"ItemButton will present");
}
- (void)pathButton:(DCPathButton *)dcPathButton clickItemButtonAtIndex:(NSUInteger)itemButtonIndex
{
    NSLog(@"You tap %@ at index : %lu", dcPathButton, (unsigned long)itemButtonIndex);
    if (itemButtonIndex == 0) {
        //点第一个按钮返回登陆
        [self dismissViewControllerAnimated:YES completion:^{
    
        }];
    }
}
- (void)didPresentDCPathButtonItems:(DCPathButton *)dcPathButton
{
    NSLog(@"ItemButton did present");
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
