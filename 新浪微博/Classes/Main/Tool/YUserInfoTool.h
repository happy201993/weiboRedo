//
//  YUserTool.h
//  新浪微博
//
//  Created by jack on 15/10/19.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YUserResult.h"
#import "YUserParams.h"
@interface YUserInfoTool : NSObject


+ (void)loadUserInfoWithParams:(YUserParams *)params success:(void(^)(YUserResult *result))success failure:(void (^)(NSError *error))failure;


@end
