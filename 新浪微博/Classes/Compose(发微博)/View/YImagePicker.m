//
//  YImagePicker.m
//  WeiBo
//
//  Created by 杨少伟 on 15/8/31.
//  Copyright (c) 2015年 YCompany. All rights reserved.
//

#import "YImagePicker.h"


static CGFloat const padding = 10;
static NSInteger const lineCount = 3;
@interface YImagePicker()



@end

@implementation YImagePicker


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubViews];
    }
    return self;
}

#pragma mark - 创建子视图
- (void)createSubViews{
    for (NSInteger i = 0 ; i < 9; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.hidden = YES;
    }
}


- (void)addImage:(UIImage *)image{
    if (_images == nil) {
        _images = [NSMutableArray array];
    }
    if (_images.count == 9) {
        return;
    }
    [_images addObject:image];
   
    [self setNeedsLayout];
    
}

//布局图片
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat imageW = (self.width - (lineCount + 1) * padding)/lineCount;
    CGFloat imageH = imageW;
    NSInteger count = self.images.count;
    NSArray *subViews = self.subviews;
    for (NSInteger i = 0 ; i < count; i++) {
        UIImageView *imageView = subViews[i];
        imageView.hidden = NO;
        imageView.width = imageW;
        imageView.height = imageH;
        NSInteger line = i/lineCount;
        NSInteger index = i%lineCount;
        imageView.x = padding + (padding + imageW) * index;
        imageView.y = (padding + imageH) * line;
        
        UIImage *image = self.images[i];
        imageView.image = image;
        
    }
    
    
}
@end
