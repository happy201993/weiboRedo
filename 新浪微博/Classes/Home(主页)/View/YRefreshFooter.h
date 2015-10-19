//
//  YRefreshFooter.h
//  新浪微博
//
//  Created by 杨少伟 on 15/10/15.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface YRefreshFooter : UIView
@property (weak, nonatomic) IBOutlet UILabel *text;

+ (instancetype)refreshFooter;

@property (nonatomic,assign,getter=isRefreshing) BOOL refresh;

- (void)beginRefresh;
- (void)endRefresh;


@end
