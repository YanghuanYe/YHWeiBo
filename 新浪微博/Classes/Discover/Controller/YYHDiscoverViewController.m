//
//  YYHDiscoverViewController.m
//  新浪微博
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YYHDiscoverViewController.h"
#import "YHSearchBar.h"

@interface YYHDiscoverViewController ()

@property (nonatomic, strong)YHSearchBar *searchBar;

@end

@implementation YYHDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self setTopNavBarTitle:@"发现"];
    
    topImageView.userInteractionEnabled = YES;
    
    CGFloat margin = 10;
    self.searchBar = [[YHSearchBar alloc] initWithFrame:CGRectMake(5, 25, kScreenW-margin, 30)];
    self.searchBar.placeholder = @"大家都在搜";
    [topImageView addSubview:self.searchBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.searchBar endEditing:YES];
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
