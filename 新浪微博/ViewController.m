//
//  ViewController.m
//  新浪微博
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "ViewController.h"
#import "YYHTabBar.h"
#import "Macro.h"

@interface ViewController ()

@end

@implementation ViewController
{
    YYHTabBar *tabBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadViewController];
}

- (void)loadViewController
{
    self.childView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScrrenH-49)];
    _childView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_childView];
    
    tabBar = [YYHTabBar sharedInstance];
    [self.view addSubview:tabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
