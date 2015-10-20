//
//  YTabBarController.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/5.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YTabBarController.h"
#import "YNavigationController.h"
#import "YHomeController.h"
#import "YMessageController.h"
#import "YDiscoverController.h"
#import "YProfileController.h"
#import "UIImage+Extension.h"
#import "YTabBar.h"
#import "YComposeViewController.h"
#import "YUserInfoTool.h"
@interface YTabBarController () <UITabBarControllerDelegate,YTabBarDelegate>
@property (nonatomic,weak) YHomeController *homeVc;
@property (nonatomic,weak) YMessageController *messageVc;
@property (nonatomic,weak) YProfileController *profileVc;
@end

@implementation YTabBarController

+ (void)initialize
{
    [self configureTabBarItem];
    [self addApplicationBadgePermission];
}

/**
 *  调整TabBarItem的外观
 */
+ (void)configureTabBarItem
{
    UITabBarItem *appearence = [UITabBarItem appearance];
    
    NSMutableDictionary *normalAttribute = [NSMutableDictionary dictionary];
    normalAttribute[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    normalAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [appearence setTitleTextAttributes:normalAttribute forState:UIControlStateNormal];
    NSMutableDictionary *selectedAttribute = [NSMutableDictionary dictionary];
    selectedAttribute[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [appearence setTitleTextAttributes:selectedAttribute forState:UIControlStateSelected];
    
}

+ (void)addApplicationBadgePermission
{
    if (iOS8) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    YTabBar *tabBar = [[YTabBar alloc] init];
    tabBar.mDelegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
    [self configureChildViewControllers];
    
    [self newMessageCount];
    
    self.delegate = self;
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    YLog(@"%@",self.tabBar.subviews);
}


#pragma mark - 获取最新消息未读数
- (void)newMessageCount
{
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
}
- (void)timeAction:(NSTimer *)timer
{
    YUserUnReadParams *params = [YUserUnReadParams params];
    params.uid = [YAccountVersionTool account].uid;
    [YUserInfoTool unreadCountWithParams:params success:^(YUserUnReadResult *result) {
        YLog(@"new  --------- %d",result.status);
        self.homeVc.tabBarItem.badgeValue = result.status?[NSString stringWithFormat:@"%d",result.status]:nil;
        self.profileVc.tabBarItem.badgeValue = result.follower?[NSString stringWithFormat:@"%d",result.follower]:nil;
        int allMessage = [result allMessageCount];
        self.messageVc.tabBarItem.badgeValue = allMessage?[NSString stringWithFormat:@"%d",allMessage]:nil;
        int allNumber = allMessage + result.status + result.follower;
        if (allNumber > 99) {
            allNumber = 99;
        }
        [UIApplication sharedApplication].applicationIconBadgeNumber = allNumber;
    } failure:^(NSError *error) {
        YLog(@"YTabBarController----newMessageCount %@",error);
    }];
}



#pragma mark - 添加子控制器
- (void)configureChildViewControllers{
    YHomeController *home = [[YHomeController alloc] init];
    [self addChildVC:home title:@"主页" image:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    self.homeVc = home;
    YMessageController *message = [[YMessageController alloc] init];
    [self addChildVC:message title:@"消息" image:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    self.messageVc = message;
                          
    YDiscoverController *discover = [[YDiscoverController alloc] init];
    [self addChildVC:discover title:@"发现" image:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
   
    
    YProfileController *profile = [[YProfileController alloc] init];
    [self addChildVC:profile title:@"我" image:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    self.profileVc = profile;

}


//添加一个子控制器
- (void)addChildVC:(UIViewController *)childVc title:(NSString *)title image:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    childVc.title = title;
    //这句话将导致控制器的view被创建 但是实际上只需要创建第一个界面的view
    //一旦这个view被创建 uiappearance外观将出现一些问题
//    childVc.view.backgroundColor = [UIColor redColor];
    UIImage *selectedImage = [UIImage imageWithImageName:selectedImageName];
    if (iOS7) {
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageWithImageName:imageName] selectedImage:selectedImage];
    
    
    YNavigationController *navi = [[YNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:navi];
}




#pragma mark - 自定义TabBar代理方法
- (void)tabBarDidSelectedPlusButton:(YTabBar *)tabBar
{
    YComposeViewController *vc = [[YComposeViewController alloc] init];
    
    YNavigationController *navi = [[YNavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:navi animated:YES completion:nil];
}

#pragma mark - UITabBarController的代理方法
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(YNavigationController *)viewController
{
    static NSInteger lastSelectIndex = 0;
    NSInteger currnetIndex = tabBarController.selectedIndex;
    if (currnetIndex == lastSelectIndex && currnetIndex == 0) {
        YHomeController *vc = (YHomeController *)viewController.topViewController;
        [vc refresh];
    }
    lastSelectIndex = currnetIndex;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
