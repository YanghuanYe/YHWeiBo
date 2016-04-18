//
//  YYHHomeViewController.m
//  新浪微博
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YYHHomeViewController.h"
//#import "Macro.h"

@interface YYHHomeViewController () <UITableViewDelegate, UITableViewDataSource>



@end

@implementation YYHHomeViewController
{
    UIButton *centerBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self setTopNavBarTitle:@"首页"];

    // 开启topImageView userInteractionEnabled，以便使后加上的button等部件能够事件响应
    topImageView.userInteractionEnabled = YES;
    
    [self setTopNavBarCenterBtn:@"首页" normalImageName:@"navigationbar_arrow_down" selectedImageName:@"navigationbar_arrow_up"];
    YHLog(@"%@", centerBtn.titleLabel.text);
    centerBtn.selected = NO;
    
    [self addATableView];
    [self setTopNavBackButton];
//    [self setTopNavBarLeftButtonWithImageName:@"navigationbar_friendsearch"];
//    [self setTopNavBackButton];
    
    ////测试事件响应链test
//    [self test];
}

////测试事件响应链test
- (void)test
{
//- (void)test
//{
//    // UIView event respond
////    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
//    //    view.center = self.view.center;
//    //    view.backgroundColor = [UIColor greenColor];
//    //    [self.view addSubview:view];
//    
//    // UIImageView event respond
////    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
////    view.center = self.view.center;
////    view.backgroundColor = [UIColor greenColor];
////    [self.view addSubview:view];
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(0, 0, 100, 40);
//    button.center = CGPointMake(100, 100);
//    [button setTitle:@"nihao" forState:UIControlStateNormal];
//    [button setTitle:@"click" forState:UIControlStateSelected];
//    button.backgroundColor = [UIColor blueColor];
//    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//    NSLog(@"%i", button.selected);
//    [view addSubview:button];
//}
//
//- (void)buttonClick:(UIButton *)btn
//{
//    btn.selected = !btn.selected;
//    YHLog(@"CLICKCLICKCLICKCLICKCLICK");
//}
}

- (void)centerBtnClick
{
//    centerBtn.selected = !centerBtn.selected;
    centerBtn.selected = !centerBtn.selected;
//    YHLog(@"CLICKCLICKCLICKCLICKCLICK");
    
    YHLog(@"%@", YHKeyWindow);
}

- (void)backBtnClick
{
    
}

- (void)addATableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreenW, kScrrenH-64-49) style:UITableViewStyleGrouped];
    //    [self.view addSubview:tableView];
    [self.view insertSubview:tableView belowSubview:topImageView];
    tableView.delegate = self;
    tableView.dataSource = self;
}

#pragma mark - UITableView实现
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 50;
    } else {
        return 20;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"List";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"main_badge"];
        cell.textLabel.text = @"hello";
    } else {
        cell.imageView.image = [UIImage imageNamed:@"navigationbar_back"];
        cell.textLabel.text = @"Code!";
    }
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private method
#pragma mark - 设置自定义导航栏的中间按钮
- (UIButton *)setTopNavBarCenterBtn:(NSString *)title normalImageName:(NSString *)imageName selectedImageName:(NSString *)selImageName
{
    centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    centerBtn.frame = CGRectMake(0, 25, self.view.frame.size.width, 30);
    [centerBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [centerBtn setTitle:title forState:UIControlStateNormal];
    [centerBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [centerBtn setImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
    [centerBtn addTarget:self action:@selector(centerBtnClick) forControlEvents:UIControlEventTouchUpInside];

    [topImageView addSubview:centerBtn];
    return centerBtn;
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
