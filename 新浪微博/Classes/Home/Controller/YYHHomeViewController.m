//
//  YYHHomeViewController.m
//  新浪微博
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YYHHomeViewController.h"
//#import "Macro.h"
#import "YHCover.h"
#import "YHPopMenu.h"
#import "YHCenterTableViewController.h"

@interface YYHHomeViewController () <UITableViewDelegate, UITableViewDataSource, YHCoverDelegate>

@property (nonatomic, strong)YHCenterTableViewController *centerTableVC;

@end

@implementation YYHHomeViewController

- (YHCenterTableViewController *)centerTableVC
{
    if (!_centerTableVC) {
        _centerTableVC = [[YHCenterTableViewController alloc] init];
    }
    return _centerTableVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 开启topImageView userInteractionEnabled，以便使后加上的button等部件能够事件响应
    topImageView.userInteractionEnabled = YES;
        
    [self setTopNavBarCenterBtn:@"首页" normalImageName:@"navigationbar_arrow_down" selectedImageName:@"navigationbar_arrow_up"];
    self.centerBtn.selected = NO;
    
    [self setTopNavBarLeftButtonWithNorImageName:@"navigationbar_friendsearch" highImageName:@"navigationbar_friendsearch_highlighted"];
    
    [self setTopNavBarRightButtonWithNorImageName:@"navigationbar_pop" highImageName:@"navigationbar_pop_highlighted"];
    
    [self addATableView];
}

#pragma mark - 导航栏按钮点击
- (void)centerBtnClick
{
    self.centerBtn.selected = !self.centerBtn.selected;

    YHCover *cover = [YHCover show];
    cover.delegate = self;
    
    CGFloat menuW = 200;
    CGFloat menuX = (kScreenW - 200)*0.5;
    CGFloat menuH = menuW;
    CGFloat menuY = 55;
    YHPopMenu *menu = [YHPopMenu showInRect:CGRectMake(menuX, menuY, menuW, menuH)];
    menu.contentView = self.centerTableVC.view;
}

- (void)leftBtnClick
{
    
}

- (void)rightBtnClick
{
    
}

- (void)addATableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreenW, kScrrenH-64-49) style:UITableViewStyleGrouped];
    [self.view insertSubview:tableView belowSubview:topImageView];
    tableView.delegate = self;
    tableView.dataSource = self;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}

#pragma mark - private method
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

#pragma mark - delegate method
- (void)coverDidClickCover:(YHCover *)cover
{
    [YHPopMenu hide];
    
    self.centerBtn.selected = NO;
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
