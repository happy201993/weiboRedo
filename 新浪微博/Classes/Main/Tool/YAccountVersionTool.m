//
//  YOAuthTool.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/14.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YAccountVersionTool.h"
#import "YAccount.h"
#define kVersionKey @"CFBundleVersion"


@implementation YAccountVersionTool


/**
 *  返回当前版本号
 */
+ (NSString *)currentVersion
{
    NSDictionary *info = [NSBundle mainBundle].infoDictionary;
    return info[kVersionKey];
}

/**
 *  把当前版本号写入沙盒
 *
 *  @param currentVersion 当前版本号
 */
+ (void)writeCurrentVersionToDisk:(NSString *)currentVersion
{
    NSUserDefaults *mDefaults = [NSUserDefaults standardUserDefaults];
    [mDefaults setObject:currentVersion forKey:kVersionKey];
    [mDefaults synchronize];
}
/**
 *  原来版本的版本号
 */
+ (NSString *)originVersion
{
    NSUserDefaults *mDefaults = [NSUserDefaults standardUserDefaults];
    return [mDefaults stringForKey:kVersionKey];
}

/**
 *  获取账户信息文件路径
 */
+ (NSString *)accountFilePath
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return  [path stringByAppendingPathComponent:YOAthoInfoPath];
}

/**
 *  将账户信息写入沙盒
 */
+ (void)writeAccountToDisk:(YAccount *)accountInfo;
{
    [NSKeyedArchiver archiveRootObject:accountInfo toFile:[self accountFilePath]];
}

/**
 *  获取账户信息文件信息
 */
+ (YAccount *)account
{
    YAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:[self accountFilePath]];
    NSComparisonResult result = [account.expires_date compare:[NSDate date]];
    //NSOrderedAscending = -1L, NSOrderedSame, NSOrderedDescending
    if (result == NSOrderedAscending) {
        account = nil;
    }
    return account;
}

@end
