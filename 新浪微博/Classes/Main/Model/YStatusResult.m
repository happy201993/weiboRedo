//
//  YStatusResult.h
//  新浪微博
//
//  Created by jack on 15/10/19.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YStatusResult.h"

@implementation YStatusResult

+ (NSDictionary *)objectClassInArray
{
    return @{@"statuses":[YStatuse class]};
}

@end
