//
//  YAccount.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/14.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YAccount.h"

@implementation YAccount

+ (instancetype)accountWithDictionary:(NSDictionary *)dict
{
    YAccount *account = [[YAccount alloc] init];
    [account setValuesForKeysWithDictionary:dict];
    //计算过期时间
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:account.expires_in.doubleValue];
    account.expires_date = date;
    return account;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.access_token = [coder decodeObjectForKey:@"access_token"];
        self.expires_in = [coder decodeObjectForKey:@"expires_in"];
        self.expires_date = [coder decodeObjectForKey:@"expires_date"];
        self.uid = [coder decodeObjectForKey:@"uid"];
    }
    return self;
}

/**
 *  将账户信息存入沙盒
 */
- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.access_token forKey:@"access_token"];
    [coder encodeObject:self.expires_in forKey:@"expires_in"];
    [coder encodeObject:self.expires_date forKey:@"expires_date"];
    [coder encodeObject:self.uid forKey:@"uid"];
}

@end
