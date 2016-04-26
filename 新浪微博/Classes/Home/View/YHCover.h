//
//  YHCover.h
//  新浪微博
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YHCover;

@protocol YHCoverDelegate <NSObject>

- (void)coverDidClickCover:(YHCover *)cover;

@end

@interface YHCover : UIView

@property (nonatomic, weak)id<YHCoverDelegate>delegate;

// 设置蒙板浅灰色背景 BOOL
@property (nonatomic, assign)BOOL dimBackgroundColor;

+ (instancetype)show;

@end
