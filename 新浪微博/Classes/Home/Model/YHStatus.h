//
//  YHStatus.h
//  新浪微博
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MJExtension.h"
#import "YHUser.h"
/*retweeted_status	object	被转发的原微博信息字段，当该微博为转发微博时返回 
 user	object	微博作者的用户信息字段 详细
 created_at	string	微博创建时间
 idstr	string	字符串型的微博ID
 text	string	微博信息内容
 source	string	微博来源
 reposts_count	int	转发数
 comments_count	int	评论数
 attitudes_count	int	表态数
 pic_ids	object	微博配图ID。多图时返回多图ID，用来拼接图片url。用返回字段thumbnail_pic的地址配上该返回字段的图片ID，即可得到多个图片url。*/

@interface YHStatus : NSObject

/**
 *  转发微博
 */
@property (nonatomic, strong)YHStatus *retweeted_status;

/**
 *  用户
 */
@property (nonatomic, strong)YHUser *user;

/**
 *  微博创建时间
 */
@property (nonatomic, copy)NSString *created_at;

/**
 *  字符串型的微博ID
 */
@property (nonatomic, copy)NSString *idstr;

/**
 *  微博信息内容
 */
@property (nonatomic, copy)NSString *text;

/**
 *  微博来源
 */
@property (nonatomic, copy)NSString *source;

/**
 *  转发数
 */
@property (nonatomic, assign)NSInteger reposts_count;

/**
 *  评论数
 */
@property (nonatomic, assign)NSInteger comments_count;

/**
 *  表态数
 */
@property (nonatomic, assign)NSInteger attitudes_count;
/**
 *
 pic_ids	object	微博配图ID。多图时返回多图ID，用来拼接图片url。用返回字段thumbnail_pic的地址配上该返回字段的图片ID，即可得到多个图片url。*/

@property (nonatomic, strong)NSArray *pic_ids;




@end
