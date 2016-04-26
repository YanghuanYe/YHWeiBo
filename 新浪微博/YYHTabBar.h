//
//  YYHTabBar.h
//  新浪微博
//
//  Created by apple on 16/4/8.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YYHTabBarDelegate <NSObject>

@optional
- (void)homeTabBarClick;
- (void)messageTabBarClick;
- (void)plusTabBarClick;
- (void)discoverTabBarClick;
- (void)profileTabBarClick;

@end

@interface YYHTabBar : UIView
{//首页、消息、“+”、发现、我
    //Home Message "+" Discover Profile
    UIButton *homeBtn;
    UIButton *messageBtn;
    UIButton *plusBtn;
    UIButton *discoverBtn;
    UIButton *profileBtn;
    
    CGFloat tabItemSpace_Width;
}

@property (nonatomic, assign)id<YYHTabBarDelegate> delegate;

+ (instancetype)sharedInstance;

- (void)hiddenYYHTabBar:(BOOL)hidden;

@end
