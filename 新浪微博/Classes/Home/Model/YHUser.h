//
//  YHUser.h
//  新浪微博
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <Foundation/Foundation.h>
/*name	string	友好显示名称
 profile_image_url	string	用户头像地址（中图），50×50像素*/

@interface YHUser : NSObject

/**
 *  用户昵称
 */
@property (nonatomic, copy)NSString *name;

/**
 *  用户头像
 */
@property (nonatomic, strong)NSURL *profile_image_url;

@end
