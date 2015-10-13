//
//  YTabBar.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/12.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YTabBar.h"



@interface YTabBar()

@property (nonatomic,weak) UIButton *plusButton;


@end

@implementation YTabBar

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
        [self configurePlusButton];
    }
    return self;
}

/**
 *  配置加号按钮
 */
- (void)configurePlusButton
{
    UIButton *button = [[UIButton alloc] init];
    self.plusButton = button;
    [self addSubview:button];
    
    UIImage *backNormalImage = [UIImage imageWithImageName:@"tabbar_compose_button"];
    UIImage *backHighlitedImage = [UIImage imageWithImageName:@"tabbar_compose_button_highlighted"];
    
    UIImage *addNormalImage = [UIImage imageWithImageName:@"tabbar_compose_icon_add"];
    UIImage *addHighlitedImage = [UIImage imageWithImageName:@"tabbar_compose_icon_add_highlighted"];
    [button setBackgroundImage:backNormalImage forState:UIControlStateNormal];
    [button setBackgroundImage:backHighlitedImage forState:UIControlStateHighlighted];
    [button setImage:addNormalImage forState:UIControlStateNormal];
    [button setImage:addHighlitedImage forState:UIControlStateNormal];
    [button addTarget:self action:@selector(plusButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:backNormalImage];
    button.size = imageView.image.size;
}

/**
 *  加号按钮监听
 */
- (void)plusButtonAction{
    if ([self.mDelegate respondsToSelector:@selector(tabBarDidSelectedPlusButton:)]) {
        [self.mDelegate tabBarDidSelectedPlusButton:self];
    }
}



#pragma mark - layoutSubviews
- (void)layoutSubviews{
    [super layoutSubviews];
    
    NSLog(@"layout subviews");
    self.plusButton.center = CGPointMake(self.width/2, self.height/2);
    
    int index = 0;
    CGFloat itemW = self.width/5;
    CGFloat itemH = self.height;
    CGFloat itemY = 0;
    CGFloat itemX;
    for (UIView *buttons in self.subviews) {
         if(![buttons isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        //是UITabBarButton
        itemX = index * itemW;
        if (index >= 2) {
            itemX += itemW;
        }
        buttons.frame = CGRectMake(itemX, itemY, itemW, itemH);
        index++;
    }
    
}



@end
