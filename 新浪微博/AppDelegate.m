//
//  AppDelegate.m
//  新浪微博
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "AppDelegate.h"
#import "YYHMainViewController.h"
#import "YHNewFeatureController.h"

#define YHVersionKey @"version"

@interface AppDelegate ()

@end

@implementation AppDelegate

// UserDefaults 优点：
// 1.不需要关心文件名
// 2.快速进行键值对存储


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 获取当前version
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
    // 获取上个verision
    NSString *previousVersion = [[NSUserDefaults standardUserDefaults] objectForKey:YHVersionKey];
    
    // 版本号对比加载页面
    if ([currentVersion isEqualToString:previousVersion]) {
        YYHMainViewController *mainVC = [[YYHMainViewController alloc] init];
        self.window.rootViewController = mainVC;

    } else {
        YHNewFeatureController *newFeatureVC = [[YHNewFeatureController alloc] init];
        self.window.rootViewController = newFeatureVC;
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:YHVersionKey];
    }
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
