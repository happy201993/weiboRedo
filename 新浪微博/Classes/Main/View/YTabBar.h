//
//  YTabBar.h
//  新浪微博
//
//  Created by 杨少伟 on 15/10/12.
//  Copyright © 2015年 YCompany. All rights reserved.
//


#import <UIKit/UIKit.h>

@class YTabBar;
@protocol YTabBarDelegate <NSObject>

- (void)tabBarDidSelectedPlusButton:(YTabBar *)tabBar;

@end

@interface YTabBar : UITabBar

@property (nonatomic,weak) id<YTabBarDelegate> mDelegate;

@end
