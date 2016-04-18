//
//  Macro.m
//  新浪微博
//
//  Created by apple on 16/4/8.
//  Copyright © 2016年 YYH. All rights reserved.
//


//屏幕尺寸
#define kScreenBounds [UIScreen mainScreen].bounds
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScrrenH [UIScreen mainScreen].bounds.size.height

//手机操作系统
#define iOS7Later iOS(>=, 7.0)
#define iOS8Later iOS(>=, 8.0)
#define iOS(sign, index) ([UIDevice currentDevice].systemVersion.doubleValue sign index)

//keyWindow
#define YHKeyWindow [UIApplication sharedApplication].keyWindow
