//
//  NSString+YExtension.h
//  01-QQ聊天布局
//
//  Created by 杨少伟 on 15/6/30.
//  Copyright (c) 2015年 yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (YExtension)
/**
 *  返回文字所占用的大小
 *
 *  @param font    字体
 *  @param maxSize 最大大小限制 maxSize == CGSizeZero 单行情况
 */
- (CGSize)sizeWithFont:(UIFont *)font withMaxSize:(CGSize)maxSize;
@end
