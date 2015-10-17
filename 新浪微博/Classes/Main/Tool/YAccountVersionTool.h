//
//  YOAuthTool.h
//  新浪微博
//
//  Created by 杨少伟 on 15/10/14.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YAccount;
@interface YAccountVersionTool : NSObject

+ (NSString *)currentVersion;
+ (void)writeCurrentVersionToDisk:(NSString *)currentVersion;
+ (NSString *)originVersion;

+ (void)writeAccountToDisk:(YAccount *)accountInfo;
+ (YAccount *)account;

@end
