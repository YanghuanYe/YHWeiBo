//
//  YHNewFeatureCell.m
//  新浪微博
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHNewFeatureCell.h"

@interface YHNewFeatureCell ()

@property (nonatomic, weak)UIImageView *imageView;

@end

@implementation YHNewFeatureCell

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
}

- (void)setCellImage:(UIImage *)cellImage
{
    _cellImage = cellImage;
    
    self.imageView.image = cellImage;
}

@end
