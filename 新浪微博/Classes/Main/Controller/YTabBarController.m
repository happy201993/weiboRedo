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
@interface YTabBarController () <UITabBarControllerDelegate,YTabBarDelegate>

@end

@implementation YTabBarController

+ (void)initialize
{
    [self configureTabBarItem];
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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    YTabBar *tabBar = [[YTabBar alloc] init];
    tabBar.mDelegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
    
    
    [self configureChildViewControllers];
    
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    YLog(@"%@",self.tabBar.subviews);
}

/**
 *  添加子控制器
 */
- (void)configureChildViewControllers{
    YHomeController *home = [[YHomeController alloc] init];
    [self addChildVC:home title:@"主页" image:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
  
    YMessageController *message = [[YMessageController alloc] init];
    [self addChildVC:message title:@"消息" image:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
   
                          
    YDiscoverController *discover = [[YDiscoverController alloc] init];
    [self addChildVC:discover title:@"发现" image:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
   
    
    YProfileController *profile = [[YProfileController alloc] init];
    [self addChildVC:profile title:@"我" image:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    

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




//- (void)changeTabBarLabelTextColor
//{
//    NSUInteger i = 0;
//    for (UIView *buttons in self.tabBar.subviews) {
//        if (![buttons isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
//        
//        for (UIView *btnSubs in buttons.subviews) {
//            UILabel *label = nil;
//            if ([btnSubs isKindOfClass:[UILabel class]]) {
//                label = (UILabel *)btnSubs;
//            }
//            if (i == self.selectedIndex) { //选中的那个按钮
//                label.textColor = [UIColor orangeColor];
//            }
//            else{ //不是选中那个按钮
//                label.textColor = [UIColor lightGrayColor];
//            }
//        }
//        
//        i++;
//    }
//}


#pragma mark - 自定义TabBar代理方法
- (void)tabBarDidSelectedPlusButton:(YTabBar *)tabBar
{
    YComposeViewController *vc = [[YComposeViewController alloc] init];
    
    YNavigationController *navi = [[YNavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:navi animated:YES completion:nil];
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
