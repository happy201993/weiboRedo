//
//  YRefreshFooter.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/15.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YRefreshFooter.h"

@implementation YRefreshFooter

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)refreshFooter
{
    YRefreshFooter *footer = [[[NSBundle mainBundle] loadNibNamed:@"YRefreshFooter" owner:nil options:nil] lastObject];
    return footer;
}

- (void)beginRefresh
{
    _refresh = YES;
}
- (void)endRefresh
{
    _refresh = NO;
}

@end
