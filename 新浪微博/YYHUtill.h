//
//  YYHUtill.h
//  新浪微博
//
//  Created by apple on 16/4/8.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YYHUtill : NSObject

#pragma mark - 颜色转换 iOS中十六进制的颜色转换成UIColor
+ (UIColor *)colorWithHexString:(NSString *)hexString;

@end
