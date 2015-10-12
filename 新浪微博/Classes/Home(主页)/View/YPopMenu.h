//
//  YPopMenu.h
//  新浪微博
//
//  Created by 杨少伟 on 15/10/12.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YPopMenu;

@protocol YPopMenuDelegate <NSObject>

- (void)popMenuDidDismiss:(YPopMenu *)menu;
@end

@interface YPopMenu : UIView

@property (nonatomic,weak) id<YPopMenuDelegate> delegate;

#pragma mark - init
- (instancetype)initWithContentView:(UIView *)contentView;
+ (instancetype)popMenuWithContentView:(UIView *)contentView;


- (void)showInRect:(CGRect)rect;
- (void)dismiss;
//- (void)setBackImage:(NSString *)image;
@end
