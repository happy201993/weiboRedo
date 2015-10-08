//
//  NSString+YExtension.m
//  01-QQ聊天布局
//
//  Created by 杨少伟 on 15/6/30.
//  Copyright (c) 2015年 yang. All rights reserved.
//

#import "NSString+YExtension.h"
@implementation NSString (YExtension)


- (CGSize)sizeWithFont:(UIFont *)font withMaxSize:(CGSize)maxSize
{
    NSDictionary *attr = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}
@end
