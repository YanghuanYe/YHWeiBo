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
    cover.backgroundColor = [UIColor clearColor];
    
    [YHKeyWindow addSubview:cover];
    
    return cover;
}

- (void)setDimBackgroundColor:(BOOL)dimBackgroundColor
{
    _dimBackgroundColor = dimBackgroundColor;
    
    if (dimBackgroundColor) {
        self.backgroundColor = [UIColor grayColor];
        self.alpha = 0.5;
    } else {
        self.alpha = 1;
        self.backgroundColor = [UIColor clearColor];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self removeFromSuperview];
    
    if (self.delegate!=nil && [self.delegate respondsToSelector:@selector(coverDidClickCover:)]) {
        [self.delegate coverDidClickCover:self];
    }
}

@end
