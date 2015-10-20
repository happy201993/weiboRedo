//
//  YNewStatusResult.m
//  新浪微博
//
//  Created by jack on 15/10/19.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YNewStatusResult.h"
#import "YPhoto.h"
@implementation YNewStatusResult

+ (NSDictionary *)objectClassInArray
{
    return @{@"pic_ids":[YPhoto class]};
}

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}

@end
