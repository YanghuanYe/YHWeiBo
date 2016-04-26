//
//  YHStatus.m
//  新浪微博
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHStatus.h"
#import "YHPhoto.h"

@implementation YHStatus

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"pic_ids":[YHPhoto class]};
}

@end
