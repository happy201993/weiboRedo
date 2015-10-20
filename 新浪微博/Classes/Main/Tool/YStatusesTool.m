//
//  YHomeStatusService.m
//  新浪微博
//
//  Created by jack on 15/10/19.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YStatusesTool.h"

@implementation YStatusesTool


+ (void)loadStatusesWithParams:(YStatusParams *)params success:(void(^)(YStatusResult *result))success failure:(void (^)(NSError *error))failure
{
    [self getWithUrl:kSinaWeiboStatusDomain params:params class:[YStatusResult class] success:success failure:failure];
}

+ (void)pulishStatusWithParams:(YNewStatusParams *)params success:(void (^)(YNewStatusResult *result))success failure:(void (^)(NSError *error))failure
{
    [self postWithUrl:kSinaWeiboPublishStatusWithoutImageDomain params:params class:[YNewStatusResult class] success:success failure:failure];
}

 + (void)pulishStatusWithParams:(YNewStatusParams *)params constructingBodyWithBlock:(void (^)(YFileFormData *formData))block success:(void (^)(YNewStatusResult *result))success failure:(void (^)(NSError *error))failure
{
      YFileFormData *mData = [[YFileFormData alloc] init];
    if (block) {
        block(mData);
    }
    
    [YHttpTool post:kSinaWeiboPublishStatusWithImageDomain params:params.keyValues constructingBodyWith:mData success:^(id responseObj) {
        YNewStatusResult *mResult = [YNewStatusResult objectWithKeyValues:responseObj];
        if(success)
        {
            success(mResult);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
