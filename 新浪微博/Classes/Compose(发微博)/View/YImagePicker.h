//
//  YImagePicker.h
//  WeiBo
//
//  Created by 杨少伟 on 15/8/31.
//  Copyright (c) 2015年 YCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YImagePicker : UIView

@property (nonatomic,strong) NSMutableArray *images;

- (void)addImage:(UIImage *)image;

@end
