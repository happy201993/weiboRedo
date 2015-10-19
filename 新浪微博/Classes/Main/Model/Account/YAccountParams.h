//
//  YAccountParams.h
//  新浪微博
//
//  Created by jack on 15/10/19.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YAccountParams : NSObject
/**
 *  AppKey
 */
@property (nonatomic,copy) NSString *client_id;

/**
 *  AppSecret
 */
@property (nonatomic,copy) NSString *client_secret;

@property (nonatomic,copy) NSString *grant_type;
/**
 *  获得的RequestCode
 */
@property (nonatomic,copy) NSString *code;

/**
 *  重定向地址
 */
@property (nonatomic,copy) NSString *redirect_uri;
@end
