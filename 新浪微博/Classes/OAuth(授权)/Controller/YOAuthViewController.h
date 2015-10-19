//
//  YOAuthViewController.h
//  新浪微博
//
//  Created by 杨少伟 on 15/10/14.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YOAuthViewControllerDelegate <NSObject>

@optional
- (void)OAuthViewControllerDidLoginWithTokenInfo:(YAccount *)account;
- (void)OAuthViewControllerDidLogFailWithError:(NSError *)error;
@end

@interface YOAuthViewController : UIViewController

@property (nonatomic,weak) id<YOAuthViewControllerDelegate> delegate;

@end
