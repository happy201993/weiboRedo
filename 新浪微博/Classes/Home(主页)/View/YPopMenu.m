//
//  YPopMenu.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/12.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YPopMenu.h"

@interface YPopMenu()

@property (nonatomic,weak) UIButton *cover;
@property (nonatomic,weak) UIImageView *backImage;
@property (nonatomic,weak) UIView *contentView;

@end

@implementation YPopMenu


- (instancetype)initWithContentView:(UIView *)contentView
{
    if (self = [super init]) {
        UIButton *button = [[UIButton alloc] init];
        [self addSubview:button];
        self.cover = button;
//        button.backgroundColor = [UIColor lightGrayColor];
//        button.alpha = 0.7;
        [button addTarget:self action:@selector(dismissAction) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
        self.backImage = imageView;
        UIImage *popImage = [UIImage resizeImage:@"popover_background"];
        imageView.image = popImage;
        imageView.userInteractionEnabled = YES;
        [imageView addSubview:contentView];
        
        self.contentView = contentView;
        self.contentView.backgroundColor = [UIColor redColor];

    }
    return self;
}
+ (instancetype)popMenuWithContentView:(UIView *)contentView
{
    return [[self alloc] initWithContentView:contentView];
}

#pragma mark - 监听按钮动作
- (void)dismissAction
{
    [self dismiss];
}

#pragma mark - public Method
- (void)showInRect:(CGRect)rect
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    self.frame = window.bounds;
    
    self.backImage.frame = rect;
    
    self.contentView.width = rect.size.width - 10;
    self.contentView.height = rect.size.height - 25;
    self.contentView.x = 5;
    self.contentView.y =  15;
}

- (void)dismiss
{
    if ([self.delegate respondsToSelector:@selector(popMenuDidDismiss:)]) {
        [self.delegate popMenuDidDismiss:self];
    }
    [self removeFromSuperview];
}




#pragma mark - layoutSubviews
- (void)layoutSubviews{
    [super layoutSubviews];
    self.cover.frame = self.bounds;
}



@end
