//
//  YHAccountTool.h
//  新浪微博
//
//  Created by apple on 16/4/21.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YHAccount;

@interface YHAccountTool : NSObject

+ (void)saveAccount:(YHAccount *)account;

+ (YHAccount *)account;

@end
