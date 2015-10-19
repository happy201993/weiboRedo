//
//  YTextView.m
//  WeiBo
//
//  Created by 杨少伟 on 15/8/31.
//  Copyright (c) 2015年 YCompany. All rights reserved.
//

#import "YTextView.h"
#import "NSString+YExtension.h"
#define Padding 5
@interface YTextView() 

@property (nonatomic,weak) UILabel *label;

@end

@implementation YTextView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
        
        //监听文字改变通知 只监听自己发出的通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}


//监听文字的改变
- (void)textChange
{
    self.label.hidden = (self.text.length != 0);
}

//移除通知
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//创建子视图
- (void)createSubViews{
    UILabel *label = [[UILabel alloc] init];
    [self addSubview:label];
    self.label = label;
    label.backgroundColor = [UIColor clearColor];
    //设置多行
    label.numberOfLines = 0;
    //默认的placeholder的字体颜色
    label.textColor = [UIColor lightGrayColor];
    //默认的placeholder的字体大小 以及textView的字体大小
    self.font = [UIFont systemFontOfSize:14];
}

//placeholder文字
- (void)setPlaceHolder:(NSString *)placeHolder
{
    _placeHolder = [placeHolder copy];
    self.label.text = placeHolder;
    [self setNeedsLayout];
}
//placeholder文字颜色 
- (void)setPlaceTextColor:(UIColor *)placeTextColor
{
    _placeTextColor = placeTextColor;
    self.label.textColor = placeTextColor;
}

//placeholder的字体应该和textView的字体相同
//而且中途修改了textView的字体 那么label的大小也应该发生变化
- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.label.font = font;
    [self setNeedsLayout];
}

//注意 通过代码修改了textView的文字 不会接收到textDidChange通知 需要自己修改
//记住 无论是代理还是通知 都不会接收到消息
- (void)setText:(NSString *)text
{
    [super setText:text];
    [self textChange];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //重新计算placeHolder的大小
    self.label.x = Padding;
    self.label.y = Padding + 3;
    CGFloat maxW = self.width - 2 * Padding;
    CGFloat maxH = MAXFLOAT;
    CGSize maxSize = CGSizeMake(maxW, maxH);
    NSString *text = self.placeHolder;
    CGSize size = [text sizeWithFont:self.label.font withMaxSize:maxSize];
    self.label.width = size.width;
    self.label.height = size.height;
}



@end
