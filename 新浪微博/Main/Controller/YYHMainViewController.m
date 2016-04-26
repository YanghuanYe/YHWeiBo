//
//  YYHMainViewController.m
//  新浪微博
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YYHMainViewController.h"
#import "YYHHomeViewController.h"
#import "YYHMessageViewController.h"
#import "YYHDiscoverViewController.h"
#import "YYHProfileViewController.h"
//#import "Macro.h"
#import "YYHTabBar.h"

@interface YYHMainViewController () <YYHTabBarDelegate>

@end

@implementation YYHMainViewController
{
    YYHHomeViewController *homeViewController;
    YYHMessageViewController *messageViewController;
    YYHDiscoverViewController *discoverViewController;
    YYHProfileViewController *profileViewController;
    YYHTabBar *tabBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadViewController];
}

- (void)loadViewController
{
    self.childView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScrrenH-49)];
    self.childView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.childView];

    [self initViewControllers];
    
    self.currentViewController = homeViewController;
    [self.childView addSubview:homeViewController.view];
    _g_flags = 0;
    NSLog(@"%@", self.childViewControllers);
    
    tabBar = [YYHTabBar sharedInstance];
    tabBar.delegate = self;
    [self.view addSubview:tabBar];
}

- (void)viewDidAppear:(BOOL)animated
{
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        for (UIView *subView in tabBar.subviews) {
//            if ([subView isKindOfClass:[UIButton class]]) {
//                //            NSLog(@"%@", subView);
//                UIButton *btn = subView;
//                [btn sendActionsForControlEvents:UIControlEventTouchUpInside];
//                break;
//            }
//        }
//    });
}

- (void)initViewControllers
{
    homeViewController = [[YYHHomeViewController alloc] init];
    [self addChildViewController:homeViewController];
    
    messageViewController = [[YYHMessageViewController alloc] init];
    [self addChildViewController:messageViewController];
    
    discoverViewController = [[YYHDiscoverViewController alloc] init];
    [self addChildViewController:discoverViewController];
    
    profileViewController = [[YYHProfileViewController alloc] init];
    [self addChildViewController:profileViewController];
}

#pragma mark - 实现代理方法
- (void)homeTabBarClick
{
    if (_g_flags == 0) {
        return;
    }
    
    [self transitionFromViewController:self.currentViewController toViewController:homeViewController duration:0 options:UIViewAnimationOptionTransitionNone animations:^{
        
    } completion:^(BOOL finished) {
        self.currentViewController = homeViewController;
        self.g_flags = 0;
    }];
}

- (void)messageTabBarClick
{
    if (_g_flags == 1) {
        return;
    }
    [self transitionFromViewController:self.currentViewController toViewController:messageViewController duration:0 options:0 animations:^{
        
    } completion:^(BOOL finished) {
        self.currentViewController = messageViewController;
        self.g_flags = 1;
    }];
}

- (void)plusTabBarClick
{
    if (_g_flags == 2) {
        return;
    }
}

- (void)discoverTabBarClick
{
    if (_g_flags == 3) {
        return;
    }
    [self transitionFromViewController:self.currentViewController toViewController:discoverViewController duration:0 options:0 animations:^{
        
    } completion:^(BOOL finished) {
        self.currentViewController = discoverViewController;
        self.g_flags = 3;
    }];
}

- (void)profileTabBarClick
{
    if (_g_flags == 4) {
        return;
    }
    [self transitionFromViewController:self.currentViewController toViewController:profileViewController duration:0 options:0 animations:^{
        
    } completion:^(BOOL finished) {
        self.currentViewController = profileViewController;
        self.g_flags = 4;
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
