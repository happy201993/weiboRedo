//
//  YUserUnReadResult.m
//  新浪微博
//
//  Created by jack on 15/10/20.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YUserUnReadResult.h"

@implementation YUserUnReadResult

- (int)allMessageCount
{
    return _cmt + _dm + _mention_cmt + _mention_status;
}

@end
