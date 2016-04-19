//
//  YHNewFeatureController.m
//  新浪微博
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHNewFeatureController.h"
#import "YHNewFeatureCell.h"

@interface YHNewFeatureController ()

@property (nonatomic, weak)UIPageControl *control;

@end

@implementation YHNewFeatureController

static NSString *reuseID = @"cell";

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置cell的尺寸
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    // 清空行距
    layout.minimumLineSpacing = 0;
    
    // 设置滚动的方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [super initWithCollectionViewLayout:layout];
}
// self.collectionView != self.view
// 注意： self.collectionView 是 self.view 的子控件

/*
 使用UICollectionViewController
 1.初始化的时候设置布局参数
 2.必须collectionView要注册cell
 3.自定义cell
 */

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    self.collectionView.backgroundColor = [UIColor greenColor];
    
//    注册cell，默认就会创建这个类型的cell
    [self.collectionView registerClass:[YHNewFeatureCell class] forCellWithReuseIdentifier:reuseID];
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    [self setUpPageControl];
}

- (void)setUpPageControl
{
    UIPageControl *control = [[UIPageControl alloc] init];
    
    control.numberOfPages = 4;
    control.pageIndicatorTintColor = [UIColor grayColor];
//    control.currentPageIndicatorTintColor = [UIColor whiteColor];
    
    control.center = CGPointMake(kScreenW*0.5, kScrrenH*0.95);
    self.control = control;
    [self.view addSubview:control];
    
}

#pragma mark - UIScroolView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5;
    
    self.control.currentPage = page;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YHNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    
    NSString *imageName = [NSString stringWithFormat:@"new_feature_%li", indexPath.row+1];
    cell.cellImage = [UIImage imageNamed:imageName];
    
    [cell setIndexPath:indexPath count:4];
    
    return cell;
}

@end
