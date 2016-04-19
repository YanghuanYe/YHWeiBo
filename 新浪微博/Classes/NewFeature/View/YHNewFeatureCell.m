//
//  YHNewFeatureCell.m
//  新浪微博
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHNewFeatureCell.h"
#import "YYHMainViewController.h"

@interface YHNewFeatureCell ()

@property (nonatomic, weak)UIImageView *imageView;
@property (nonatomic, weak)UIButton *sharedBtn;
@property (nonatomic, weak)UIButton *startBtn;

@end

@implementation YHNewFeatureCell

- (UIButton *)sharedBtn
{
    if (!_sharedBtn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"分享给大家" forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(sharedBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn sizeToFit];
        
        [self.contentView addSubview:btn];
        
        _sharedBtn = btn;
    }
    return _sharedBtn;
}

- (UIButton *)startBtn
{
    if (!_startBtn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"开始微博" forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(startBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [btn sizeToFit];
        
        [self.contentView addSubview:btn];
        
        _startBtn = btn;
    }
    return _startBtn;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        UIImageView *imageV = [[UIImageView alloc] init];
        
        _imageView = imageV;
        
        [self.contentView addSubview:imageV];
    }
    return _imageView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
    
    CGSize size = self.contentView.frame.size;
    self.sharedBtn.center = CGPointMake(size.width*0.5, size.height*0.75);
    
    self.startBtn.center = CGPointMake(size.width*0.5, size.height*0.85);
}

- (void)setCellImage:(UIImage *)cellImage
{
    _cellImage = cellImage;
    
    self.imageView.image = cellImage;
}

- (void)setIndexPath:(NSIndexPath *)indexPath count:(int)count
{
    if (indexPath.row == count - 1) {
        self.sharedBtn.hidden = NO;
        self.startBtn.hidden = NO;
    } else {
        self.sharedBtn.hidden = YES;
        self.startBtn.hidden = YES;
    }
}

#pragma mark - private method
- (void)sharedBtnClick
{
    self.sharedBtn.selected = !self.sharedBtn.selected;
}

- (void)startBtnClick
{
    YYHMainViewController *mainVC = [[YYHMainViewController alloc] init];
    
    //切换根控制器：可以直接把之前的根控制器清空
    YHKeyWindow.rootViewController = mainVC;
}

@end
