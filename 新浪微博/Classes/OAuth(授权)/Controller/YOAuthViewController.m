//
//  YOAuthViewController.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/14.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YOAuthViewController.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"
#import "YAccountVersionTool.h"


@interface YOAuthViewController () <UIWebViewDelegate>
@property (nonatomic,weak) UIWebView *webView;
@end

@implementation YOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView = webView;
    [self.view addSubview:webView];
    webView.delegate = self;
    NSString *urlStr = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",kAppKey,kAppRedirectURI];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlString = request.URL.absoluteString;
    YLog(@"r = %@",request.URL.absoluteString);
    //如果授权成功 那么进行拦截
    NSString *str = [NSString stringWithFormat:@"%@/?code=",kAppRedirectURI];
    NSRange range = [urlString rangeOfString:str];
    if (range.location != NSNotFound) {
        //获取code
        NSString *code = [urlString substringFromIndex:range.location+range.length];
        //获取token
        [self accessTokenWithCode:code];
        return NO;
    }
    
    return YES;
}
- (void)accessTokenWithCode:(NSString *)code
{
    //获取请求管理对象
    YAccountParams *params = [[YAccountParams alloc] init];
    params.client_id = kAppKey;
    params.client_secret = kAppSecret;
    params.grant_type = @"authorization_code";
    params.code = code;
    params.redirect_uri = kAppRedirectURI;
    [YAccountVersionTool accessTokenWithParams:params success:^(YAccount *account) {
        [MBProgressHUD hideHUD];
        if ([self.delegate respondsToSelector:@selector(OAuthViewControllerDidLoginWithTokenInfo:)]) {
            [self.delegate OAuthViewControllerDidLoginWithTokenInfo:account];
        }
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUD];
        if ([self.delegate respondsToSelector:@selector(OAuthViewControllerDidLogFailWithError:)]) {
            [self.delegate OAuthViewControllerDidLogFailWithError:error];
        }
    }];
}

#pragma mark - webView代理
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showMessage:@"正在加载中..."];
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUD];
}




@end
