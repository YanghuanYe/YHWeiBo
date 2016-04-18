//
//  YYHBaseViewController.m
//  新浪微博
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YYHBaseViewController.h"
#import "Macro.h"

@interface YYHBaseViewController ()

@end

@implementation YYHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    // 开启topImageView userInteractionEnabled，以便使后加上的button等部件能够事件响应
//    topImageView.userInteractionEnabled = YES;
    
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor grayColor];
    [self setTopNavBarBackground];
    [self.view addSubview:topImageView];
}

#pragma mark - 设置导航栏的title
- (void)setTopNavBarTitle:(NSString *)title
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, self.view.frame.size.width, 30)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor orangeColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.text = title;

    [topImageView addSubview:titleLabel];
}

//#pragma mark - 设置自定义导航栏的中间按钮
//- (UIButton *)setTopNavBarCenterBtn:(NSString *)title normalImageName:(NSString *)imageName selectedImageName:(NSString *)selImageName
//{
//    UIButton *centerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 25, self.view.frame.size.width, 30)];
//    [centerBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
//    [centerBtn setTitle:title forState:UIControlStateNormal];
//    [centerBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//    [centerBtn setImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
////    centerBtn.userInteractionEnabled = YES;
//    [centerBtn addTarget:self action:@selector(centerBtnClick) forControlEvents:UIControlEventTouchUpInside];
////    [self setBtn:centerBtn];
//    
//
//    
//    [topImageView addSubview:centerBtn];
//    return centerBtn;
//}
//
//- (void)centerBtnClick
//{
//    if (self.delegate!= nil && [self.delegate respondsToSelector:@selector(centerBtnClick)]) {
//        [self.delegate centerBtnClickEvent];
//    }
//}

//- (void)setBtn:(UIButton *)button;
//{
//    button.titleEdgeInsets = UIEdgeInsetsMake(0, -button.imageView.frame.size.width - button.frame.size.width + button.titleLabel.intrinsicContentSize.width, 0, 0);
//    button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -button.titleLabel.frame.size.width - button.frame.size.width + button.imageView.frame.size.width);
//}

#pragma mark - 设置导航栏左边按钮
- (void)setTopNavBarLeftButtonWithImageName:(NSString *)imageName
{
    UIImageView *leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    leftView.frame = CGRectMake(0, 14, 60, 24);
    
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.frame = CGRectMake(10, 12, 60, 40);
    _leftBtn.backgroundColor = [UIColor clearColor];
    [_leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_leftBtn addSubview:leftView];
    [topImageView addSubview:_leftBtn];
}

#pragma mark - 设置导航栏右边按钮
- (void)setTopNavBarRightButtonWithImageName:(NSString *)imageName
{
    UIImageView *rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    rightView.frame = CGRectMake(4, 16, 24, 24);
    
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.frame = CGRectMake(kScreenW-40, 12, 40, 40);
    _rightBtn.backgroundColor = [UIColor clearColor];
    [_rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_rightBtn addSubview:rightView];
    [topImageView addSubview:_rightBtn];
}

#pragma mark - 设置导航栏左边按钮文字
- (void)setTopBarLeftBarItemWithTitle:(NSString *)title
{
    UILabel *textLabel = [self generateLabel:title];
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.frame = CGRectMake(10, 20, 44, 34);
    _leftBtn.backgroundColor = [UIColor clearColor];
    [_leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_leftBtn addSubview:textLabel];
    [topImageView addSubview:_leftBtn];
}

#pragma mark - 设置导航栏右边按钮文字
- (void)setTopBarRightBarItemWithTitle:(NSString *)title
{
    UILabel *textLabel = [self generateLabel:title];
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.frame = CGRectMake(kScreenW-80, 20, 80, 34);
    _rightBtn.backgroundColor = [UIColor clearColor];
    [_rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_rightBtn addSubview:textLabel];
    [topImageView addSubview:_rightBtn];
}

#pragma mark - 设置navigationBar返回按钮
- (void)setTopNavBackButton
{
    UIImageView *backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigationbar_back"]];
    backView.frame = CGRectMake(13, 22, 20, 18);
    
    _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _backBtn.frame = CGRectMake(0, 12, 52, 52);
    _backBtn.backgroundColor = [UIColor clearColor];
    [_backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_backBtn addSubview:backView];
    [topImageView addSubview:_backBtn];
}

// 生成自定义label
- (UILabel *)generateLabel: (NSString *)str
{
    if (_textLabel == nil) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.text = str;
        _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.adjustsFontSizeToFitWidth = YES;
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.frame = CGRectMake(0, 12, 60, 17);
    } else {
        _textLabel.text = str;
    }
    return _textLabel;
}

#pragma mark - action method
- (void)leftBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBtnClick
{
    
}

- (void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - private method
- (void)setTopNavBarBackground
{
    topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    topImageView.backgroundColor = [UIColor whiteColor];
    [self setTopNavBarLine];
}


- (void)setTopNavBarLine
{
    if (topImageView != nil) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 63.5, kScreenW, 0.5)];
        lineView.backgroundColor = [UIColor blueColor];
        [topImageView addSubview:lineView];
    }
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
