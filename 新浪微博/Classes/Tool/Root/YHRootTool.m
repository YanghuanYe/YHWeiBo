//
//  YHRootTool.m
//  新浪微博
//
//  Created by apple on 16/4/21.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHRootTool.h"
#import "YYHMainViewController.h"
#import "YHNewFeatureController.h"

#define YHVersionKey @"version"

@implementation YHRootTool

+ (void)chooseRootViewController:(UIWindow *)window
{
    // 获取当前version
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
    // 获取上个verision
    NSString *previousVersion = [[NSUserDefaults standardUserDefaults] objectForKey:YHVersionKey];
    
    // 版本号对比加载页面
    if ([currentVersion isEqualToString:previousVersion]) {
        YYHMainViewController *mainVC = [[YYHMainViewController alloc] init];
        window.rootViewController = mainVC;
        
    } else {
        YHNewFeatureController *newFeatureVC = [[YHNewFeatureController alloc] init];
        window.rootViewController = newFeatureVC;
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:YHVersionKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
