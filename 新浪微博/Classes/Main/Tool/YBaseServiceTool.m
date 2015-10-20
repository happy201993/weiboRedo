//
//  YBaseServiceTool.m
//  新浪微博
//
//  Created by jack on 15/10/20.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YBaseServiceTool.h"
#import "YHttpTool.h"

@implementation YBaseServiceTool
+ (void)getWithUrl:(NSString *)url params:(id)params class:(Class)mClass success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure
{
    [YHttpTool get:url params:[params keyValues] success:^(NSDictionary *responseObject) {
        id mResult = [mClass objectWithKeyValues:responseObject];
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

+ (void)postWithUrl:(NSString *)url params:(id)params class:(Class)mClass success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure
{
    [YHttpTool post:url params:[params keyValues] success:^(NSDictionary *responseObject) {
        id mResult = [mClass objectWithKeyValues:responseObject];
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
