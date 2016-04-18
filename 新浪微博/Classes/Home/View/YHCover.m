//
//  YHCover.m
//  新浪微博
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHCover.h"

@implementation YHCover

+ (instancetype)show
{
    YHCover *cover = [[self alloc] initWithFrame:kScreenBounds];
//    cover.backgroundColor = [UIColor clearColor];
    cover.backgroundColor = [UIColor redColor];
    
    [YHKeyWindow addSubview:cover];
    
    return cover;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self removeFromSuperview];
}

@end
