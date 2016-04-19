//
//  UIImage+Image.h
//  新浪微博
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

// 加载最原始的图片， 没有渲染
+ (instancetype)imageWithOriginalName:(NSString *)imageName;

+ (instancetype)imageWithStretchableName:(NSString *)imageName;

@end
