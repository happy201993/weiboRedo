//
//  YTitleButton.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/8.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YTitleButton.h"
#import "UIImage+Extension.h"

@implementation YTitleButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        //设置图片在高亮情况下不变灰
        self.adjustsImageWhenHighlighted = NO;
        
        //设置选中时的背景
        UIImage *selectedBackground = [UIImage resizeImage:@"navigationbar_filter_background_highlighted"];
        [self setBackgroundImage:selectedBackground forState:UIControlStateHighlighted];
        
    }
    return self;
}



+ (instancetype)titleButton
{
    return [[self alloc] init];
}

//设置按钮中图片的位置
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    YLog( @"imageW = %@",self.imageView);
    CGFloat imageW = self.imageView.size.width;
    CGFloat imageH = self.height;
    CGFloat imageX = self.width - imageW;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

//设置按钮中标题的位置
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = self.width - self.imageView.size.width;
    CGFloat titleH = self.height;
    return  CGRectMake(titleX, titleY, titleW, titleH);
}



@end
