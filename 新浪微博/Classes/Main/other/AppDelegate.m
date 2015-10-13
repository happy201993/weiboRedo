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

#define kVersionKey @"CFBundleVersion"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //01 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //02 创建根视图控制器
    UIViewController *rootVc = nil;
    
    NSString *currentVersion = [self currentVersion];
    NSString *originVersion = [self originVersion];
    if (![currentVersion isEqualToString:originVersion]) {
        [self writeCurrentVersionToDisk:currentVersion];
        rootVc = [[YNewfeatureController alloc] init];
    }
    else{
        rootVc = [[YTabBarController alloc] init];
    }
    rootVc = [[YNewfeatureController alloc] init];
    
    //03 设置窗口根视图控制器
    self.window.rootViewController = rootVc;
    
    //04 设置为主窗口并可见
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}
/**
 *  返回当前版本号
 */
- (NSString *)currentVersion
{
    NSDictionary *info = [NSBundle mainBundle].infoDictionary;
    return info[kVersionKey];
}

/**
 *  把当前版本号写入沙盒
 *
 *  @param currentVersion 当前版本号
 */
- (void)writeCurrentVersionToDisk:(NSString *)currentVersion
{
    NSUserDefaults *mDefaults = [NSUserDefaults standardUserDefaults];
    [mDefaults setObject:currentVersion forKey:kVersionKey];
    [mDefaults synchronize];
}
/**
 *  原来版本的版本号
 */
- (NSString *)originVersion
{
    NSUserDefaults *mDefaults = [NSUserDefaults standardUserDefaults];
    return [mDefaults stringForKey:kVersionKey];
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

@end
