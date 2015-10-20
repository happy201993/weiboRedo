//
//  YUserTool.h
//  新浪微博
//
//  Created by jack on 15/10/19.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YBaseServiceTool.h"
#import "YUserResult.h"
#import "YUserParams.h"
#import "YUserUnReadParams.h"
#import "YUserUnReadResult.h"
@interface YUserInfoTool : YBaseServiceTool


+ (void)loadUserInfoWithParams:(YUserParams *)params success:(void(^)(YUserResult *result))success failure:(void (^)(NSError *error))failure;

+ (void)unreadCountWithParams:(YUserUnReadParams *)params success:(void(^)(YUserUnReadResult *result))success failure:(void (^)(NSError *error))failure;


@end
