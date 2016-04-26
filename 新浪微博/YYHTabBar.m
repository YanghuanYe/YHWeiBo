//
//  YYHTabBar.m
//  新浪微博
//
//  Created by apple on 16/4/8.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YYHTabBar.h"
#import "Macro.h"
#import "YYHUtill.h"

@interface YYHTabBar ()

@property (nonatomic, strong)NSMutableArray *tabItemsArray;
@property (nonatomic, assign)NSInteger selectedIndex;
@property (nonatomic, strong)UIButton *selectedBtn;

@end

@implementation YYHTabBar


enum barsize {
    tabItem_width = 49,
    tabItem_height = 49,
    
    tabBar_height = 49,
};

- (NSMutableArray *)tabItemsArray
{
    if (!_tabItemsArray) {
        _tabItemsArray = [NSMutableArray array];
    }
    return _tabItemsArray;
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static YYHTabBar *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    if (self = [super init]) {
        [self setTabBarFrame];
    }
    return self;
}

- (void)setTabBarFrame
{
    NSInteger tabBarItemCount = 5;
    tabItemSpace_Width = (kScreenW - tabBarItemCount*tabItem_width)/(tabBarItemCount+1);
    self.frame = CGRectMake(0, kScrrenH - tabBar_height, kScreenW, tabBar_height);
    [self setBackgroundColor:[YYHUtill colorWithHexString:@"#d4d4d4"]];
    
    homeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self setUpButton:homeBtn NorImage:@"tabbar_home" selImage:@"tabbar_home_selected" title:@"首页"];
    homeBtn.selected = YES;
    self.selectedBtn = homeBtn;
    self.selectedIndex = homeBtn.tag;
    [self addSubview:homeBtn];
    
    messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self setUpButton:messageBtn NorImage:@"tabbar_message_center" selImage:@"tabbar_message_center_selected" title:@"消息"];
    [self addSubview:messageBtn];
    
    plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self setUpButton:plusBtn norImage:@"tabbar_compose_icon_add" highImage:@"tabbar_compose_icon_add_highlighted" title:nil bgImage:@"tabbar_compose_button" highBgImage:@"tabbar_compose_button_highlighted"];
    [self addSubview:plusBtn];
    
    discoverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self setUpButton:discoverBtn NorImage:@"tabbar_discover" selImage:@"tabbar_discover_selected" title:@"发现"];
    [self addSubview:discoverBtn];
    
    profileBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self setUpButton:profileBtn NorImage:@"tabbar_profile" selImage:@"tabbar_profile_selected" title:@"个人"];
    [self addSubview:profileBtn];
    
    UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 0.5)];
    [lineImage setBackgroundColor:[YYHUtill colorWithHexString:@"dfdfdf"]];
    [self addSubview:lineImage];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 1)];
    lineView.backgroundColor = [YYHUtill colorWithHexString:@"#d4d4d4"];
    [self addSubview:lineView];
}

//点击事件
- (void)buttonClickAction:(UIButton *)sender
{
    if (self.selectedIndex == sender.tag) {
        return;
    }
    self.selectedBtn.selected = NO;
    self.selectedIndex = sender.tag;
    self.selectedBtn = sender;
    sender.selected = YES;
    [self imgAnimate:sender];
    [self callBtnAction:sender];
}

- (void)callBtnAction:(UIButton *)sender
{
    switch (sender.tag) {
        case 0:
            if ([self.delegate respondsToSelector:@selector(homeTabBarClick)]) {
                [self.delegate homeTabBarClick];
            }
            break;
        case 1:
            if ([self.delegate respondsToSelector:@selector(messageTabBarClick)]) {
                [self.delegate messageTabBarClick];
            }
            break;
        case 2:
            if ([self.delegate respondsToSelector:@selector(plusTabBarClick)]) {
                [self.delegate plusTabBarClick];
            }
            break;
        case 3:
            if ([self.delegate respondsToSelector:@selector(discoverTabBarClick)]) {
                [self.delegate discoverTabBarClick];
            }
            break;
        case 4:
            if ([self.delegate respondsToSelector:@selector(profileTabBarClick)]) {
                [self.delegate profileTabBarClick];
            }
            break;
            
        default:
            break;
    }
}

- (void)layoutSubviews
{
    int i = 0;
    for (UIButton *tabItem in self.tabItemsArray) {
        if (i == 2) {
            UIImage *image = [UIImage imageNamed:@"tabbar_compose_button"];
            tabItem.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
            tabItem.center = CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5);
            tabItem.tag = i;
            [tabItem addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
            i++;
            continue;
        }
        tabItem.frame = CGRectMake(i*tabItem_width+(i+1)*tabItemSpace_Width, 0, tabItem_width, tabItem_height);
        [self transformImageAndTitleVerticalWithButton:tabItem];
        tabItem.tag = i;
        [tabItem addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        i++;
    }
}

- (void)hiddenYYHTabBar:(BOOL)hidden
{
    self.hidden = hidden;
}

#pragma mark - private method
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

#pragma mark - 设置button的图片(normal与selected)与文字并加入self.tabItemsArray
- (void)setUpButton:(UIButton *)button NorImage:(NSString *)norImage selImage:(NSString *)selImage title:(NSString *)title
{
    [button setImage:[UIImage imageNamed:norImage] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selImage] forState:UIControlStateSelected];
    [button setTitle:title forState:UIControlStateNormal];
    [self.tabItemsArray addObject:button];
}

#pragma mark - 设置button的图片(normal与highlited)与文字以及背景图片并加入、self.tabItemsArray
- (void)setUpButton:(UIButton *)button norImage:(NSString *)norImage highImage:(NSString *)highImage title:(NSString *)title bgImage:(NSString *)bgImage highBgImage:(NSString *)highBgImage
{
    [button setImage:[UIImage imageNamed:norImage] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:bgImage] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highBgImage] forState:UIControlStateHighlighted];
    [self.tabItemsArray addObject:button];
}

#pragma mark - 动画效果（可调用）
- (void)imgAnimate:(UIButton *)btn
{
    UIView *view = btn.subviews[0];
//    NSLog(@"%@", btn.subviews);
    
    [UIView animateWithDuration:0.1 animations:^{
        view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
            } completion:^(BOOL finished) {
                
            }];
        }];
    }];
}

@end
