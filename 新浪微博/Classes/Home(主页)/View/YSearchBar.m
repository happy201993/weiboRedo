//
//  YSearchBar.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/8.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YSearchBar.h"
#import "UIImage+Extension.h"
@implementation YSearchBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //背景
        UIImage *backgroundImage = [UIImage resizeImage:@"searchbar_textfield_background"];
        self.background = backgroundImage;
        //搜索图片
        UIImage *searchIcon = [UIImage imageWithImageName:@"searchbar_textfield_search_icon"];
        UIImageView *leftView = [[UIImageView alloc] initWithImage:searchIcon];
        //    leftView.backgroundColor = [UIColor redColor];
        //这里leftView.image.size 是图片在设备上显示的点像素的尺寸 而不是图片的原始尺寸
//        YLog(@"leftView size = %@",NSStringFromCGSize(leftView.image.size));
        leftView.height = leftView.image.size.height + 10;
        leftView.width = leftView.height;
      
        leftView.contentMode = UIViewContentModeCenter;
        self.leftView = leftView;
        self.leftViewMode = UITextFieldViewModeAlways;

        //调整内容在垂直方向上的对齐方式
        //    searchBar.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
        //这个属性没有用 因为这个属性由textAlignment设置 textalignment 的优先级比它高
        //    searchBar.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
        //设置删除按钮
        self.clearButtonMode = UITextFieldViewModeWhileEditing;

    }
    return self;
}

//init内部会调用initWithFrame
//但是 initWithFrame 不会调用 init
+ (instancetype)searchBar
{
    return [[self alloc] init];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
//    self.leftView.y = 0;
//    self.leftView.height = self.height;
//    
//    YLog(@"leftView height = %@",NSStringFromCGRect(self.leftView.frame));
//    self.leftView.width = self.height;
}

@end
