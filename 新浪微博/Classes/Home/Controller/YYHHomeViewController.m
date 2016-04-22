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
#import "MJRefresh.h"
#import "AFNetworking.h"
#import "YHAccountTool.h"
#import "YHAccount.h"
#import "YHStatus.h"
#import "YHUser.h"
#import "MJExtension.h"

#import "UIImageView+WebCache.h"

@interface YYHHomeViewController () <UITableViewDelegate, UITableViewDataSource, YHCoverDelegate>

@property (nonatomic, strong)YHCenterTableViewController *centerTableVC;

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)NSMutableArray *statuses;

@end

@implementation YYHHomeViewController

- (NSMutableArray *)statuses
{
    if (!_statuses) {
        _statuses = [NSMutableArray array];
    }
    return _statuses;
}

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
    
    //tableView MJRefresh setup mj_header
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // begin refreshing
    [self.tableView.mj_header beginRefreshing];
    
    // setup mj_footer
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadPreviousData)];
//    self.tableView.mj_footer.automaticallyRefresh = NO;
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
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
}

//#pragma mark - UITableView Delegate
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 100;
//}

#pragma mark - UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"MicroBlog";
    __block UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseID];
    }
    
    // 获取status模型
    YHStatus *status = self.statuses[indexPath.row];
    
    cell.textLabel.text = status.user.name;
    
    [cell.imageView sd_setImageWithURL:status.user.profile_image_url placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        cell.imageView.image = image;
        [cell setNeedsLayout];
    }];
    
    cell.detailTextLabel.text = status.text;
    
    return cell;
}



/*statuses/friends_timeline
 获取当前登录用户及其所关注（授权）用户的最新微博
 URL
 https://api.weibo.com/2/statuses/friends_timeline.json
 access_token	true	string	采用OAuth授权方式为必填参数，OAuth授权后获得。*/
#pragma mark - MJRefresh Method
// refresh data
- (void)loadNewData
{
    NSString *urlStr = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/friends_timeline.json"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //since_id	false	int64	若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0。
    if (self.statuses.count) {
        params[@"since_id"] = [self.statuses[0] idstr];
    }
    params[@"access_token"] = [YHAccountTool account].access_token;
    
    [manager GET:urlStr parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 停止上拉刷新
        [self.tableView.mj_header endRefreshing];
        
        // 获取到微博数据字典 转换成模型
        // 获取微博字典数组
        NSArray *dicArray = responseObject[@"statuses"];
        // 把微博数据字典转换成模型数组
        NSArray *statuses = [YHStatus mj_objectArrayWithKeyValuesArray:dicArray];
        
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, statuses.count)];
        [self.statuses insertObjects:statuses atIndexes:indexSet];
        
        NSLog(@"%@", self.statuses);
        
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tableView.mj_header endRefreshing];
        YHLog(@"%@", error);
    }];
}

- (void)loadPreviousData
{
    AFHTTPSessionManager *manager= [AFHTTPSessionManager manager];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (self.statuses.count) {
        long long maxID = [[[self.statuses lastObject] idstr] longLongValue] - 1;
        params[@"max_id"] = [NSString stringWithFormat:@"%lld", maxID];
    }
    params[@"access_token"] = [YHAccountTool account].access_token;
    NSString *urlStr = @"https://api.weibo.com/2/statuses/friends_timeline.json";
    [manager GET:urlStr parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.tableView.mj_footer endRefreshing];
        
        // 换取微博数据 转换成模型
        NSArray *dicArray = responseObject[@"statuses"];
        NSArray *statuses = [YHStatus mj_objectArrayWithKeyValuesArray:dicArray];
        
        [self.statuses addObjectsFromArray:statuses];
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tableView.mj_footer endRefreshing];
        YHLog(@"%@", error);
    }];
}

#pragma mark - YHCover delegate method
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
