//
//  YYHMessageViewController.m
//  新浪微博
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YYHMessageViewController.h"

@interface YYHMessageViewController ()

@end

@implementation YYHMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    topImageView.userInteractionEnabled = YES;
    
    [self setTopNavBarTitle:@"消息"];
    
    [self setTopNavBarRightButtonWithTitle:@"发起聊天"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)rightBtnClick
{
    [UIView animateWithDuration:0.1 animations:^{
        self.rightBtn.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.rightBtn.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
        } completion:^(BOOL finished) {
            self.rightBtn.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
        }];
    }];
    NSLog(@"clickclickclick");
}
/*[UIView animateWithDuration:0.1 animations:^{
 view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
 } completion:^(BOOL finished) {
 [UIView animateWithDuration:0.2 animations:^{
 view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
 } completion:^(BOOL finished) {
 [UIView animateWithDuration:0.1 animations:^{
 view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
 } completion:^(BOOL finished) {
 
 }];
 }];
 }];*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
