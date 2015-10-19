//
//  AppDelegate.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/2.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "AppDelegate.h"
#import "YTabBarController.h"
#import "YNewfeatureController.h"
#import "YOAuthViewController.h"
#import "MBProgressHUD+MJ.h"
@interface AppDelegate () <YOAuthViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    YLog(@"%@",NSHomeDirectory());
    
    //01 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //02 创建根视图控制器
    UIViewController *rootVc = nil;
    //获取账户信息
    YAccount *accountInfo = [YAccountVersionTool account];
    if (accountInfo == nil) {
        YOAuthViewController *vc  = [[YOAuthViewController alloc] init];
        vc.delegate = self;
        rootVc = vc;
    }
    else{
        rootVc = [self rootViewControllerWithVersion];
    }
    //03 设置窗口根视图控制器
    self.window.rootViewController = rootVc;
    //04 设置为主窗口并可见
    [self.window makeKeyAndVisible];
    
    
    
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                YLog(@"AFNetworkReachabilityStatusUnknown");
            case AFNetworkReachabilityStatusNotReachable:
                YLog(@"AFNetworkReachabilityStatusNotReachable");
                [MBProgressHUD showError:@"网络错误!"];
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                //手机网络
                YLog(@"AFNetworkReachabilityStatusReachableViaWWAN");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                //wifi
                 YLog(@"AFNetworkReachabilityStatusReachableViaWiFi");
                break;
        }
    }];
    //开始监控
    [mgr startMonitoring];
    return YES;
}


/**
 *  判断版本具体逻辑
 *
 *  @return 返回正确地根控制器
 */
- (UIViewController *)rootViewControllerWithVersion
{
     UIViewController *rootVc = nil;
    //检查版本
    NSString *currentVersion = [YAccountVersionTool currentVersion];
    NSString *originVersion = [YAccountVersionTool originVersion];
    if (![currentVersion isEqualToString:originVersion]) {
        [YAccountVersionTool writeCurrentVersionToDisk:currentVersion];
        rootVc = [[YNewfeatureController alloc] init];
    }
    else{
        rootVc = [[YTabBarController alloc] init];
    }
    return rootVc;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)applicatio
{
    SDWebImageManager *mgr = [SDWebImageManager sharedManager];
    //取消所有操作
    [mgr cancelAll];
    //清除内存
    [mgr.imageCache clearMemory];
}

#pragma mark - 登录后的代理方法
- (void)OAuthViewControllerDidLoginWithTokenInfo:(YAccount *)account
{
    UIViewController *rootVc = [self rootViewControllerWithVersion];
    self.window.rootViewController = rootVc;
}

- (void)OAuthViewControllerDidLogFailWithError:(NSError *)error
{
    YLog(@"error ----- %@",error);
}

@end
