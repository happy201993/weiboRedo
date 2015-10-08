//
//  UIImage+Extension.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/5.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)imageWithImageName:(NSString *)imageName
{
    UIImage *mImage = nil;
//    NSString *resImageName = nil;
    if (iOS7) {
        NSString *os7ImageName = [imageName stringByAppendingString:@"_os7"];
//        resImageName = os7ImageName;
        mImage = [UIImage imageNamed:os7ImageName];
    }
    
    if (mImage == nil) {
        //用普通的名称
        mImage = [UIImage imageNamed:imageName];
//        resImageName = imageName;
    }
    
//    YLog(@"imagename - %@",resImageName);
    return mImage;
}

+ (UIImage *)resizeImage:(NSString *)imageName
{
    UIImage *image = [self imageNamed:imageName];
    CGFloat top = image.size.height/2;//顶端盖高度
    CGFloat bottom = image.size.height - top - 1;
    CGFloat left = image.size.width/2;
    CGFloat right = image.size.width - left - 1;
    UIEdgeInsets padding = UIEdgeInsetsMake(top, left, bottom, right);
    //ios5之前
    //    [image stretchableImageWithLeftCapWidth:... topCapHeight:...]
    //ios5
    //    [image resizableImageWithCapInsets:...]
    //ios6
    //    UIImageResizingModeTile,  //平铺
    //    UIImageResizingModeStretch, //拉伸
    UIImage *newImage = [image resizableImageWithCapInsets:padding resizingMode:UIImageResizingModeStretch];
    return newImage;
}

@end
