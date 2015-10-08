//
//  UIBarButtonItem+YExtension.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/5.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "UIBarButtonItem+YExtension.h"
#import "NSString+YExtension.h"
@implementation UIBarButtonItem (YExtension)
+ (instancetype)itemWithImageName:(NSString *)name selectedImageName:(NSString *)selectedImageName target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    UIImage *normalImage = [UIImage imageNamed:name];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    [button setBackgroundImage:normalImage forState:UIControlStateNormal];
    [button setBackgroundImage:selectedImage forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.size = normalImage.size;
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (instancetype)itemWithTitle:(NSString *)title color:(UIColor *)color selectedColor:(UIColor *)selectedColor font:(UIFont *)font target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = font;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitleColor:selectedColor forState:UIControlStateHighlighted];
    //设置不可点击时的颜色
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    CGSize size = [title sizeWithFont:font withMaxSize:CGSizeMake(200, font.lineHeight)];
    button.size = size;
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
@end
