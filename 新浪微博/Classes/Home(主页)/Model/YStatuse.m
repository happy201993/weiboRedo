//
//  YStatuse.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/14.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YStatuse.h"
#import "YPhoto.h"

@implementation YStatuse

/**
 *  字典中的key是数组属性名，value是数组中存放模型的Class（Class类型或者NSString类型）
 */
+(NSDictionary *)objectClassInArray
{
    return @{
             @"pic_urls":[YPhoto class]
             };
}
/**
 *  将id替换为ID
 */
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{
             @"ID":@"id"
             };
}




@end
