//
//  YUserParams.h
//  新浪微博
//
//  Created by jack on 15/10/19.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YUserParams : NSObject

/**
 *  访问标记
 */
@property (nonatomic,copy) NSString *access_token;

/**
 *  用户ID
 */
@property (nonatomic,strong) NSNumber *uid;

@end
