//
//  YBaseParams.m
//  新浪微博
//
//  Created by jack on 15/10/19.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YBaseParams.h"

@implementation YBaseParams

- (instancetype)init
{
    if (self = [super init]) {
        self.access_token = [YAccountVersionTool account].access_token;
    }
    return self;
}

+ (instancetype)params
{
    return [[self alloc] init];
}
@end
