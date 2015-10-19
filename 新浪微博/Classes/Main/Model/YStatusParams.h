//
//  YStatusParams.h
//  新浪微博
//
//  Created by jack on 15/10/19.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YStatusParams : NSObject

@property (nonatomic,copy) NSString *access_token;

@property (nonatomic,strong) NSNumber *since_id;

@property (nonatomic,strong) NSNumber *max_id;

/**
 *  加载微博的条数
 */
@property (nonatomic,strong) NSNumber *count;

@end
