//
//  YHAccountTool.m
//  新浪微博
//
//  Created by apple on 16/4/21.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHAccountTool.h"
#import "YHAccount.h"

#define YHAccountFilePath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account"]

@implementation YHAccountTool

// 类方法一般用静态变量代替成员变量
static YHAccount *_account;

+ (void)saveAccount:(id)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:YHAccountFilePath];
}

+ (YHAccount *)account
{
    if (_account == nil) {
        _account = [NSKeyedUnarchiver unarchiveObjectWithFile:YHAccountFilePath];
        
        if ([[NSDate date] compare:_account.expires_date] != NSOrderedAscending) {
            // 过期
            return nil;
        }
    }
    
    return _account;
}

@end
