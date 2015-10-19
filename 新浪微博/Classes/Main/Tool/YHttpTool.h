//
//  YHttpTool.h
//  新浪微博
//
//  Created by jack on 15/10/18.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "YFileFormData.h"
//@protocol YMultipartFormData <NSObject>
//
//- (void)appendPartWithFileData:(NSData *)data
//                          name:(NSString *)name
//                      fileName:(NSString *)fileName
//                      mimeType:(NSString *)mimeType;
//
//@end

@interface YHttpTool : NSObject

+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;



+ (void)post:(NSString *)url params:(NSDictionary *)params constructingBodyWithBlock:(void (^) (YFileFormData *formData))block success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

@end
