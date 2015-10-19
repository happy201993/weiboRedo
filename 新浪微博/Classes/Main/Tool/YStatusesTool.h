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
#import "YNewStatusParams.h"
#import "YNewStatusResult.h"
@interface YStatusesTool : NSObject

/**
 *  加载微博数据
 *
 *  @param params  请求参数
 *  @param success 返回微博数据的block
 *  @param failure 返回错误信息的block
 */
+ (void)loadWeiboStatusWithParams:(YStatusParams *)params success:(void(^)(YStatusResult *result))success failure:(void (^)(NSError *error))failure;

/**
 *  发布一条新微博
 *
 *  @param params  请求参数
 *  @param success 返回微博数据的block
 *  @param failure 返回错误信息的block
 */
+ (void)pulishWeiboWithParams:(YNewStatusParams *)params success:(void (^)(YNewStatusResult *result))success failure:(void (^)(NSError *error))failure;


@end
