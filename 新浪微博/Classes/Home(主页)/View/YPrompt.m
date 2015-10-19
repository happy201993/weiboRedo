//
//  YPrompt.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/17.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YPrompt.h"

@implementation YPrompt

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
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithImageName:@"timeline_new_status_background"]];
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:18];
        self.textColor = [UIColor whiteColor];
    }
    return self;
}

+ (instancetype)promptWithText:(NSString *)text
{
    YPrompt *label = [[self alloc] init];
    label.text = text;
    return label;
}
@end
