//
//  YBaseServiceTool.h
//  新浪微博
//
//  Created by jack on 15/10/20.
//  Copyright © 2015年 YCompany. All rights reserved.


// 业务类的基类 封装业务操作

#import <Foundation/Foundation.h>

@interface YBaseServiceTool : NSObject

+ (void)getWithUrl:(NSString *)url params:(id)params class:(Class)mClass success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;


+ (void)postWithUrl:(NSString *)url params:(id)params class:(Class)mClass success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;
@end
