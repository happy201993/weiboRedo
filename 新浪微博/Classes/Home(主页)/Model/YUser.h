//
//  YUser.h
//  新浪微博
//
//  Created by 杨少伟 on 15/10/14.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YUser : NSObject


/**
 *  用户的uid
 */
@property (nonatomic,strong) NSNumber *uid;
/*    "screen_name": "zaku",*/
@property (nonatomic,copy) NSString *screen_name;
/*province	int	用户所在省级ID*/
@property (nonatomic,assign) int province;
/*city	int	用户所在城市ID*/
@property (nonatomic,assign) int city;
//    "location": "北京 朝阳区",
/*    "description": "人生五十年，乃如梦如幻；有生斯有死，壮士复何憾。",*/
//@property (nonatomic,copy) NSString *description;
//    "url": "http://blog.sina.com.cn/zaku",
/*    "profile_image_url": "http://tp1.sinaimg.cn/1404376560/50/0/1",*/
@property (nonatomic,copy) NSString *profile_image_url;
/*    性别，m：男、f：女、n：未知 */
@property (nonatomic,copy) NSString *gender;
/*followers_count	int	粉丝数*/
@property (nonatomic,assign) int followers_count;
/*friends_count	int	关注数 */
@property (nonatomic,assign) int friends_count;
/*statuses_count	int	微博数 */
@property (nonatomic,assign) int statuses_count;
/*favourites_count	int	收藏数 */
@property (nonatomic,assign) int favourites_count;
/*created_at	string	用户创建（注册）时间 */
@property (nonatomic,copy) NSString *created_at;

@end
