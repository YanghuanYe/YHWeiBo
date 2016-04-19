//
//  YHNewFeatureCell.h
//  新浪微博
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHNewFeatureCell : UICollectionViewCell

@property (nonatomic, strong)UIImage *cellImage;

// 判断是否是最后一页
- (void)setIndexPath:(NSIndexPath *)indexPath count:(int)count;

@end
