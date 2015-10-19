//
//  YStatusResult.h
//  新浪微博
//
//  Created by jack on 15/10/19.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YStatusResult : NSObject

/**
 *  微博列表
 */
@property (nonatomic,strong) NSArray *statuses;
/**
 *  微博总数
 */
@property (nonatomic,strong) NSNumber *total_number;

@end
