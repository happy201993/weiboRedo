//
//  YTitleButton.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/8.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YTitleButton.h"
#import "UIImage+Extension.h"
#import "NSString+YExtension.h"
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
        
        //设置图片的内容模式
        self.imageView.contentMode = UIViewContentModeCenter;
        
        //设置字体
        self.titleLabel.font = YTitleFont;
        
        //设置title的对齐方式
        self.titleLabel.textAlignment = NSTextAlignmentRight;
//        self.imageView.backgroundColor = [UIColor redColor];
//        self.titleLabel.backgroundColor = [UIColor yellowColor];
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
    CGFloat imageH = self.height;
    CGFloat imageW = imageH;
    CGFloat imageX = self.width - imageW;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

//设置按钮中标题的位置
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = self.width - self.height;
    CGFloat titleH = self.height;
    return  CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    NSString *titleText = self.currentTitle;
    CGSize size = [titleText sizeWithFont:YTitleFont withMaxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    self.width = size.width + self.height + 10;
}



@end
