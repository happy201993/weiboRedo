//
//  YUserUnReadResult.h
//  新浪微博
//
//  Created by jack on 15/10/20.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YUserUnReadResult : NSObject

/**status	int	新微博未读数*/
@property (nonatomic,assign) int status;
/**follower	int	新粉丝数*/
@property (nonatomic,assign) int follower;
/**cmt	int	新评论数*/
@property (nonatomic,assign) int cmt;
/**dm	int	新私信数*/
@property (nonatomic,assign) int dm;
/**mention_status	int	新提及我的微博数*/
@property (nonatomic,assign) int mention_status;
/**mention_cmt	int	新提及我的评论数*/
@property (nonatomic,assign) int mention_cmt;

- (int)allMessageCount;
@end
