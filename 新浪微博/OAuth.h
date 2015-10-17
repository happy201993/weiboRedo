//
//  OAuth.h
//  新浪微博
//
//  Created by 杨少伟 on 15/10/14.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#ifndef OAuth_h
#define OAuth_h

App Key：
3064080673
App Secret：
1b7d2ce8f0d30467f083b8aa98a06270

//获取当前登录用户及其所关注用户的最新微博
https://api.weibo.com/2/statuses/home_timeline.json
source	false	string	采用OAuth授权方式不需要此参数，其他授权方式为必填参数，数值为应用的AppKey。
access_token	false	string	采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得。



#endif /* OAuth_h */
