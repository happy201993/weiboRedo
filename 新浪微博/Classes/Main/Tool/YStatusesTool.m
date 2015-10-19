//
//  YHomeStatusService.m
//  新浪微博
//
//  Created by jack on 15/10/19.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YStatusesTool.h"
#import "YHttpTool.h"
@implementation YStatusesTool


+ (void)loadWeiboStatusWithParams:(YStatusParams *)params success:(void(^)(YStatusResult *result))success failure:(void (^)(NSError *error))failure
{
    NSDictionary *paramsDict = params.keyValues;
    [YHttpTool get:kSinaWeiboStatusDomain params:paramsDict success:^(NSDictionary *responseObject) {
        YStatusResult *mResult = [YStatusResult objectWithKeyValues:responseObject];
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

+ (void)pulishWeiboWithParams:(YNewStatusParams *)params success:(void (^)(YNewStatusResult *result))success failure:(void (^)(NSError *error))failure
{
    [YHttpTool post:kSinaWeiboPublishStatusWithoutImageDomain params:params.keyValues success:^(NSDictionary *responseObj){
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
