//
//  UIImage+Extension.h
//  新浪微博
//
//  Created by 杨少伟 on 15/10/5.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
//返回一张图片 屏蔽系统版本
+ (UIImage *)imageWithImageName:(NSString *)imageName;
//返回一张拉伸后的图片
+ (UIImage *)resizeImage:(NSString *)imageName;
@end
