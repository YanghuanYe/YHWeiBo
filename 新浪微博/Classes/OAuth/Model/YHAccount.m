//
//  YHAccount.m
//  新浪微博
//
//  Created by apple on 16/4/21.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHAccount.h"
/*{
 "access_token" = "2.00WZ5DECUp5B6Dfcfed1304elw44BD";
 "expires_in" = 157679999;
 "remind_in" = 157679999;
 uid = 1892180450;
 }*/

#define YHAccess_TokenKey @"access_token"
#define YHExpires_InKey @"expires_in"
#define YHUidKey @"uid"
#define YHExpires_DateKey @"expires_date"

@implementation YHAccount

+ (instancetype)accountWithDic:(NSDictionary *)dic
{
    YHAccount *account = [[self alloc] init];
    
    [account setValuesForKeysWithDictionary:dic];
    
    return account;
}

- (void)setExpires_in:(NSString *)expires_in
{
    _expires_in = _expires_in;
    
    _expires_date = [NSDate dateWithTimeIntervalSinceNow:[expires_in longLongValue]];
}

// 归档的时候调用：告诉系统哪个属性需要归档，如何归档
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_access_token forKey:YHAccess_TokenKey];
    [aCoder encodeObject:_expires_in forKey:YHExpires_InKey];
    [aCoder encodeObject:_uid forKey:YHUidKey];
    [aCoder encodeObject:_expires_date forKey:YHExpires_InKey];
}

// 解档的时候调用：告诉系统哪个属性需要解档，如何解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        _access_token = [aDecoder decodeObjectForKey:YHAccess_TokenKey];
        _expires_in = [aDecoder decodeObjectForKey:YHExpires_InKey];
        _uid = [aDecoder decodeObjectForKey:YHUidKey];
        _expires_date = [aDecoder decodeObjectForKey:YHExpires_DateKey];
    }
    return self;
}

@end
