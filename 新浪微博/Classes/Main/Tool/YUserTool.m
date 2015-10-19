//
//  YUserTool.m
//  新浪微博
//
//  Created by jack on 15/10/19.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YUserTool.h"
#import "YHttpTool.h"
@implementation YUserTool

+ (void)loadUserInfoWithParams:(YUserParams *)params success:(void(^)(YUser *user))success failure:(void (^)(NSError *error))failure
{

    [YHttpTool get:kSinaWeiboUserInfoDomain params:params.keyValues success:^(NSDictionary *responseObject) {
        YUser *user = [YUser objectWithKeyValues:responseObject];
        if (success) {
            success(user);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];

}

@end
