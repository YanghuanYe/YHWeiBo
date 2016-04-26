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
//    titleLabel.textColor = [UIColor orangeColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.text = title;

    [topImageView addSubview:titleLabel];
}

#pragma mark - 设置自定义导航栏的中间按钮
- (UIButton *)setTopNavBarCenterBtn:(NSString *)title normalImageName:(NSString *)imageName selectedImageName:(NSString *)selImageName
{
    self.centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _centerBtn.frame = CGRectMake(100, 25, self.view.frame.size.width-100*2, 30);
//    [_centerBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [_centerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_centerBtn setTitle:title forState:UIControlStateNormal];
    [_centerBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [_centerBtn setImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
    [_centerBtn addTarget:self action:@selector(centerBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    //调用private method实现button内文字在左，图片在右
//    [self transformImageAndTitleHorizontalWithButton:self.centerBtn];
    
    [topImageView addSubview:self.centerBtn];
    return self.centerBtn;
}
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

- (void)setTopNavBarLeftButtonWithNorImageName:(NSString *)norImageName highImageName:(NSString *)highImageName
{
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.frame = CGRectMake(10, 28, 28, 28);
    self.leftBtn.backgroundColor = [UIColor clearColor];
    [self.leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:norImageName] forState:UIControlStateNormal];
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    [topImageView addSubview:self.leftBtn];
}

- (void)setTopNavBarLeftButtonWithTitle:(NSString *)buttonTitle
{
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.frame = CGRectMake(0, 25, 80, 34);
    self.leftBtn.backgroundColor = [UIColor clearColor];
    self.leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.leftBtn setTitle:buttonTitle forState:UIControlStateNormal];
    [self.leftBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [topImageView addSubview:self.leftBtn];
}

#pragma mark - 设置导航栏右边纯图片按钮
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

- (void)setTopNavBarRightButtonWithNorImageName:(NSString *)norImageName highImageName:(NSString *)highImageName
{
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.frame = CGRectMake(kScreenW-10-28, 28, 28, 28);
    _rightBtn.backgroundColor = [UIColor clearColor];
    [_rightBtn setBackgroundImage:[UIImage imageNamed:norImageName] forState:UIControlStateNormal];
    [_rightBtn setBackgroundImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    [_rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [topImageView addSubview:_rightBtn];
}

- (void)setTopNavBarRightButtonWithTitle:(NSString *)buttonTitle
{
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    // 向右留出12的间隙
    _rightBtn.frame = CGRectMake(kScreenW-80, 25, 68, 34);
    _rightBtn.backgroundColor = [UIColor clearColor];
    // 右对齐
//    self.rightBtn.titleLabel.textAlignment = NSTextAlignmentRight;
//    NSMutableDictionary *attributeDic = @{};
//    self.rightBtn setAttributedTitle:<#(nullable NSAttributedString *)#> forState:<#(UIControlState)#>
    [self.rightBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.rightBtn setTitle:buttonTitle forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [topImageView addSubview:_rightBtn];
}

#pragma mark - 设置导航栏左边按钮文字
- (void)setTopNavBarLeftBarItemWithTitle:(NSString *)title
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
- (void)setTopNavBarRightBarItemWithTitle:(NSString *)title
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

- (void)centerBtnClick
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

#pragma mark - 把button的图片和文字上下排列，更改按钮的字体颜色
- (void)transformImageAndTitleVerticalWithButton:(UIButton *)button
{
    button.titleEdgeInsets = UIEdgeInsetsMake(0, -button.imageView.frame.size.width, -button.imageView.frame.size.height, 0);
    // button.imageEdgeInsets = UIEdgeInsetsMake(-button.titleLabel.frame.size.height, 0, 0, -button.titleLabel.frame.size.width);
    // 由于iOS8中titleLabel的size为0，用上面这样设置有问题，修改一下即可
    button.imageEdgeInsets = UIEdgeInsetsMake(-button.titleLabel.intrinsicContentSize.height, 0, 0, -button.titleLabel.intrinsicContentSize.width);
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setTitleColor:[YYHUtill colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    [button setTitleColor:[YYHUtill colorWithHexString:@"#ff6a0f"] forState:UIControlStateSelected];
}

- (void)transformImageAndTitleHorizontalWithButton:(UIButton *)button
{
    button.titleEdgeInsets = UIEdgeInsetsMake(0, -button.imageView.frame.size.width - button.frame.size.width , 0, 0);//+ button.titleLabel.intrinsicContentSize.width - button.frame.size.width
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -button.titleLabel.frame.size.width );//- button.frame.size.width + button.imageView.frame.size.width
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
