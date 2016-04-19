//
//  YHSearchBar.m
//  新浪微博
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHSearchBar.h"

@implementation YHSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont systemFontOfSize:13];
        
        self.background = [UIImage imageWithStretchableName:@"searchbar_textfield_background"];
        
        UIImageView *searchIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        searchIcon.contentMode = UIViewContentModeCenter;
//        searchIcon.width += 10;
        self.leftView = searchIcon;
        // 一定要设置UITextFieldViewModeAlways，不然不会显示
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

@end
