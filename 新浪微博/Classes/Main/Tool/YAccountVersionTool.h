//
//  YOAuthTool.h
//  新浪微博
//
//  Created by 杨少伟 on 15/10/14.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YAccountParams.h"
#import "YAccount.h"
@interface YAccountVersionTool : NSObject

+ (NSString *)currentVersion;
+ (void)writeCurrentVersionToDisk:(NSString *)currentVersion;
+ (NSString *)originVersion;

+ (void)writeAccountToDisk:(YAccount *)accountInfo;
+ (YAccount *)account;

/**
 *  获取AccessToken
 *
 *  @param params  请求参数
 *  @param success 返回微博数据的block
 *  @param failure 返回错误信息的block
 */
+ (void)accessTokenWithParams:(YAccountParams *)params success:(void (^)(YAccount *account))success failure:(void (^)(NSError *error))failure;

@end
