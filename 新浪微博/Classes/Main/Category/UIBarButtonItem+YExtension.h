//
//  UIBarButtonItem+YExtension.h
//  新浪微博
//
//  Created by 杨少伟 on 15/10/5.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YExtension)

+ (instancetype)itemWithImageName:(NSString *)name selectedImageName:(NSString *)selectedImageName target:(id)target action:(SEL)action;

+ (instancetype)itemWithTitle:(NSString *)title color:(UIColor *)color selectedColor:(UIColor *)selectedColor font:(UIFont *)font target:(id)target action:(SEL)action;
@end
