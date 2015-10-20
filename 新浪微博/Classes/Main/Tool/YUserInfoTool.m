//
//  YUserTool.m
//  新浪微博
//
//  Created by jack on 15/10/19.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YUserInfoTool.h"
#import "YHttpTool.h"
@implementation YUserInfoTool

+ (void)loadUserInfoWithParams:(YUserParams *)params success:(void(^)(YUserResult *result))success failure:(void (^)(NSError *error))failure
{
    [self getWithUrl:kSinaWeiboUserInfoDomain params:params class:[YUserResult class] success:success failure:failure];
}

+ (void)unreadCountWithParams:(YUserUnReadParams *)params success:(void(^)(YUserUnReadResult *result))success failure:(void (^)(NSError *error))failure
{
    [self getWithUrl:kSinaWeiboUserUnReadMessageDomain params:params class:[YUserUnReadResult class] success:success failure:failure];
}

@end
