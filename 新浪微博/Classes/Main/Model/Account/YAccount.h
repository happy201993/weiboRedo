//
//  YAccount.h
//  新浪微博
//
//  Created by 杨少伟 on 15/10/14.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YAccount : NSObject <NSCoding>

/**
 *  访问标记
 */
@property (nonatomic,copy) NSString *access_token;

/**
 *  有效时间
 */
@property (nonatomic,strong) NSNumber *expires_in;

/**
 *  过期时间
 */
@property (nonatomic,strong) NSDate *expires_date;

/**
 *  用户ID
 */
@property (nonatomic,strong) NSNumber *uid;
/**
 *  用户昵称
 */
@property (nonatomic,copy) NSString *screen_name;



@end
