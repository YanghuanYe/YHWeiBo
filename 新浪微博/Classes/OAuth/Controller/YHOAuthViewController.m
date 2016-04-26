//
//  YHOAuthViewController.m
//  新浪微博
//
//  Created by apple on 16/4/20.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHOAuthViewController.h"
#import "MBProgressHUD.h"
#import "AFNetworking.h"
#import "YHAccount.h"
#import "YHAccountTool.h"
#import "YHRootTool.h"

#define YHClient_ID @"3118140672"
#define YHClient_Secret @"ec695d0c9ee30739a733aabef117621f"
#define YHGrant_Type @"authorization_code"
#define YHRedirect_Uri @"http://www.jianshu.com/users/c31155bd6942/latest_articles"


@interface YHOAuthViewController () <UIWebViewDelegate, MBProgressHUDDelegate>

@property (nonatomic, strong)MBProgressHUD *HUD;

@end

@implementation YHOAuthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 20, kScreenW, kScrrenH-20)];
    [self.view addSubview:webView];
    
    //https://api.weibo.com/oauth2/authorize&client_id=&redirect_uri=
    //appKey = 3118140672
    //回调地址：http://www.jianshu.com/users/c31155bd6942/latest_articles
    
    // 拼接URL字符串
    NSString *webUrl = @"https://api.weibo.com/oauth2/authorize";
    NSString *client_id = @"3118140672";
    NSString *redirect_uri = @"http://www.jianshu.com/users/c31155bd6942/latest_articles";
    NSString *urlStr = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@", webUrl, client_id, redirect_uri];
    
    // 创建URL
    NSURL *url = [NSURL URLWithString:urlStr];
    
    // 创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 加载请求
    [webView loadRequest:request];
    
    // 设置代理
    webView.delegate = self;
}

#pragma mark - UIWebView Delegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    // 以后再抽出来弄个分类
    [self HUDShow];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // 隐藏HUD
    [self.HUD hideAnimated:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    // 隐藏HUD
    [self.HUD hideAnimated:YES];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlStr = request.URL.absoluteString;

    // get code(RequestToken)
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.length) {
        NSString *code = [urlStr substringFromIndex:range.location + range.length];
        // 换取 access_token
        [self accessTokenWithCode:code];
        
        return NO;
    }
    
    return YES;
}

//#pragma mark - MBProgressHUD delegate
//- (void)hudWasHidden:(MBProgressHUD *)hud
//{
//    [hud removeFromSuperview];
//    hud = nil;
//}

#pragma mark - private method
- (void)HUDShow
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.mode = MBProgressHUDModeAnnularDeterminate;
    HUD.delegate = self;
    HUD.labelText = @"Loading";
    [HUD showWhileExecuting:@selector(myProgressTask) onTarget:self withObject:nil animated:YES];
    self.HUD = HUD;
}

- (void)myProgressTask
{
    YHLog(@"nnn");
}

/*请求参数
 必选	类型及范围	说明
 client_id	true	string	申请应用时分配的AppKey。
 client_secret	true	string	申请应用时分配的AppSecret。
 grant_type	true	string	请求的类型，填写authorization_code
 
 grant_type为authorization_code时
 必选	类型及范围	说明
 code	true	string	调用authorize获得的code值。
 redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。*/
#pragma mark - 换取accessToken
- (void)accessTokenWithCode:(NSString *)code
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *webStr = @"https://api.weibo.com/oauth2/access_token";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = YHClient_ID;
    params[@"client_secret"] = YHClient_Secret;
    params[@"grant_type"] = YHGrant_Type;
    params[@"code"] = code;
    params[@"redirect_uri"] = YHRedirect_Uri;
    [manager POST:webStr parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        
        // 字典转模型
        YHAccount *account = [YHAccount accountWithDic:responseObject];
        
        // 保存账号信息
        [YHAccountTool saveAccount:account];
        
        [YHRootTool chooseRootViewController:[UIApplication sharedApplication].keyWindow];
//        NSLog(@"%@", self.view.window);
//        NSLog(@"%@", [UIApplication sharedApplication].keyWindow);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}


@end
