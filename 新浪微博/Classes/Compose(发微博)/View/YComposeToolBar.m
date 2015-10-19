//
//  YComposeToolBar.m
//  WeiBo
//
//  Created by 杨少伟 on 15/8/30.
//  Copyright (c) 2015年 YCompany. All rights reserved.
//

#import "YComposeToolBar.h"
#define YComposeBarH 44
@implementation YComposeToolBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置背景
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"compose_toolbar_background_os7"]];
        [self createSubViews];
        self.height = YComposeBarH;
    }
    return self;
}

#pragma mark - 创建子视图
- (void)createSubViews{
    
     [self addButtonWithNormalImageName:@"compose_camerabutton_background_os7" withHighlight: @"compose_camerabutton_background_highlighted_os7" withButtonType:YComposeToolBarTypeTakePicture];
    
    [self addButtonWithNormalImageName:@"compose_toolbar_picture_os7" withHighlight: @"compose_toolbar_picture_highlighted_os7" withButtonType:YComposeToolBarTypePicture];
    
     [self addButtonWithNormalImageName:@"compose_mentionbutton_background_os7" withHighlight: @"compose_mentionbutton_background_highlighted_os7" withButtonType:YComposeToolBarTypeMention];
     [self addButtonWithNormalImageName:@"compose_trendbutton_background_os7" withHighlight: @"compose_trendbutton_background_highlighted_os7" withButtonType:YComposeToolBarTypeTopic];
     [self addButtonWithNormalImageName:@"compose_emoticonbutton_background_os7" withHighlight: @"compose_emoticonbutton_background_highlighted_os7" withButtonType:YComposeToolBarTypeEmotion];
    
}


- (void)addButtonWithNormalImageName:(NSString *)nor withHighlight:(NSString *)high withButtonType:(YComposeToolBarType)type{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:nor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:high] forState:UIControlStateHighlighted];
    button.tag = type;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

- (void)buttonAction:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(composeToolBar:didClickButtonType:)]) {
        [self.delegate composeToolBar:self didClickButtonType:button.tag];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    CGFloat buttonW = self.width/count;
    CGFloat buttonH = YComposeBarH;
    for (NSInteger i = 0 ; i < count; i++) {
        UIButton *button = self.subviews[i];
        button.x = i * buttonW;
        button.y = 0;
        button.width = buttonW;
        button.height = buttonH;
    }
}
@end
