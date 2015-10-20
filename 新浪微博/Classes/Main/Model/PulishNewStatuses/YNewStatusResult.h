//
//  YNewStatusResult.h
//  新浪微博
//
//  Created by jack on 15/10/19.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YNewStatusResult : NSObject
/** id	int64	微博ID*/
@property (nonatomic,strong) NSNumber *ID;
/*  NSString 内容*/
@property (nonatomic,copy) NSString *text;

/*  NSString 来源*/
@property (nonatomic,copy) NSString *source;

/*  NSString 来源*/
@property (nonatomic,assign) BOOL favorited;

/* user	object	微博作者的用户信息字段 详细*/
@property (nonatomic,strong) YUser *user;

/*reposts_count	int	转发数*/
@property (nonatomic,assign) int reposts_count;
/*comments_count	int	评论数*/
@property (nonatomic,assign) int comments_count;
/*attitudes_count	int	表态数*/
@property (nonatomic,assign) int attitudes_count;

/*pic_urls	object	微博配图ID。多图时返回多图ID，用来拼接图片url。用返回字段thumbnail_pic的地址配上该返回字段的图片ID，即可得到多个图片url。*/
@property (nonatomic,strong) NSArray *pic_urls;
@end
