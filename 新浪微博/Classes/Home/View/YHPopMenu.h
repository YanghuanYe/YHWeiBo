//
//  YHPopMenu.h
//  新浪微博
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHPopMenu : UIImageView

@property (nonatomic, weak)UIView *contentView;

+ (instancetype)showInRect:(CGRect)rect;

+ (void)hide;

@end
