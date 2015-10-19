//
//  YComposeToolBar.h
//  WeiBo
//
//  Created by 杨少伟 on 15/8/30.
//  Copyright (c) 2015年 YCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YComposeToolBar;


typedef NS_ENUM(NSUInteger, YComposeToolBarType) {
    YComposeToolBarTypePicture,
    YComposeToolBarTypeMention,
    YComposeToolBarTypeTopic,
    YComposeToolBarTypeEmotion,
    YComposeToolBarTypeTakePicture,
};

@protocol YComposeToolBarDelegate <NSObject>

@optional
- (void)composeToolBar:(YComposeToolBar *)toolBar didClickButtonType:(YComposeToolBarType)type;

@end

@interface YComposeToolBar : UIView

@property (nonatomic,assign) id<YComposeToolBarDelegate> delegate;

@end
