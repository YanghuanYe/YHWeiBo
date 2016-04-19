//
//  YHPopMenu.m
//  新浪微博
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHPopMenu.h"
#import "UIImage+Image.h"
//
//@interface YHPopMenu ()
//
//@property (nonatomic, assign)CGRect kRect;
//
//@end

@implementation YHPopMenu


+ (instancetype)showInRect:(CGRect)rect
{
//    NSLog(@"__func__%s", __func__);
    YHPopMenu *menu = [[YHPopMenu alloc] initWithFrame:rect];
    menu.userInteractionEnabled = YES;
    menu.image = [UIImage imageWithStretchableName:@"popover_background"];
    menu.alpha =0.9;
    
    [YHKeyWindow addSubview:menu];
    
    return menu;
}

- (void)setContentView:(UIView *)contentView
{
//    NSLog(@"__func__%s", __func__);
    [_contentView removeFromSuperview];
    
    _contentView = contentView;
    contentView.backgroundColor = [UIColor clearColor];
    
    [self addSubview:contentView];
}

+ (void)hide
{
    for (UIView *menu in YHKeyWindow.subviews) {
        if ([menu isKindOfClass:[YHPopMenu class]]) {
            [menu removeFromSuperview];
        }
    }
}

- (void)layoutSubviews
{
//    NSLog(@"__func__%s", __func__);
    [super layoutSubviews];
    
    CGFloat y = 9;
    CGFloat margin = 5;
    CGFloat x = margin;
    CGFloat w = self.frame.size.width - 2 * margin;
    CGFloat h = self.frame.size.height - y - margin;
    
    _contentView.frame = CGRectMake(x, y, w, h);
}

@end
