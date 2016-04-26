//
//  YYHBaseViewController.h
//  新浪微博
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol YYHBaseViewControllerDelegate <NSObject>
//
//- (void)centerBtnClickEvent;
//
//@end

@interface YYHBaseViewController : UIViewController
{
    UIImageView *topImageView;
}

//@property (nonatomic, weak)id<YYHBaseViewControllerDelegate> delegate;

@property (nonatomic, strong)UIButton *centerBtn;
@property (nonatomic, strong)UIButton *backBtn;
@property (nonatomic, strong)UIButton *leftBtn;
@property (nonatomic, strong)UIButton *rightBtn;
@property (nonatomic, strong)UILabel *textLabel;

// 设置自定义导航栏的title
- (void)setTopNavBarTitle:(NSString *)title;

// 设置自定义导航栏的中间按钮
- (UIButton *)setTopNavBarCenterBtn:(NSString *)title normalImageName:(NSString *)imageName selectedImageName:(NSString *)selImageName;

// 设置navigationBar 左边纯图片按钮
- (void)setTopNavBarLeftButtonWithImageName:(NSString *)imageName;

- (void)setTopNavBarLeftButtonWithNorImageName:(NSString *)norImageName highImageName:(NSString *)highImageName;

// 设置navigationBar 左边纯文字按钮
- (void)setTopNavBarLeftButtonWithTitle:(NSString *)buttonTitle;

// 设置navigationBar 右边纯图片按钮
- (void)setTopNavBarRightButtonWithImageName:(NSString *)imageName;

- (void)setTopNavBarRightButtonWithNorImageName:(NSString *)norImageName highImageName:(NSString *)highImageName;

// 设置navigationBar 右边纯文字按钮
- (void)setTopNavBarRightButtonWithTitle:(NSString *)buttonTitle;

// 设置navigationBar 左边按钮的文字标题
- (void)setTopNavBarLeftBarItemWithTitle:(NSString *)title;

// 设置navigationBar 右边按钮的文字标题
- (void)setTopNavBarRightBarItemWithTitle:(NSString *)title;

// 设置navigationBar 返回按钮
- (void)setTopNavBackButton;

//- (void)setTopNavBgColorWithString

// actionClick
- (void)backBtnClick;
- (void)leftBtnClick;
- (void)rightBtnClick;

@end
