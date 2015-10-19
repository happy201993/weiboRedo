//
//  YFileFormData.h
//  新浪微博
//
//  Created by jack on 15/10/19.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFileFormData : NSObject
//- (void)appendPartWithFileData:(NSData *)data
//                          name:(NSString *)name
//                      fileName:(NSString *)fileName
//                      mimeType:(NSString *)mimeType;
/**
 *  二进制数据
 */
@property (nonatomic,strong) NSData *data;

/**
 *
 */
@property (nonatomic,copy) NSString *name;
/**
 *  给服务器用的文件名称
 */
@property (nonatomic,copy) NSString *fileName;
/**
 *  数据类型
 */
@property (nonatomic,copy) NSString *mimeType;


@end
