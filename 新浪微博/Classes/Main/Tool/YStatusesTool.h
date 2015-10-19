//
//  YHomeStatusService.h
//  新浪微博
//
//  Created by jack on 15/10/19.
//  Copyright © 2015年 YCompany. All rights reserved.
//
/**
 *  封装微博业务
 */

#import <Foundation/Foundation.h>
#import "YStatusParams.h"
#import "YStatusResult.h"
@interface YStatusesTool : NSObject


+ (void)loadWeiboStatusWithParams:(YStatusParams *)params success:(void(^)(YStatusResult *result))success failure:(void (^)(NSError *error))failure;



@end
