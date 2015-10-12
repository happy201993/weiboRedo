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
@interface YTabBarController () <UITabBarControllerDelegate>

@end

@implementation YTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self configureChildViewControllers];
}


- (void)configureChildViewControllers{
    YHomeController *home = [[YHomeController alloc] init];
    [self addChildVC:home title:@"主页" image:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
  
    YMessageController *message = [[YMessageController alloc] init];
    [self addChildVC:message title:@"消息" image:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
   
                          
    YDiscoverController *discover = [[YDiscoverController alloc] init];
    [self addChildVC:discover title:@"发现" image:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
   
    
    YProfileController *profile = [[YProfileController alloc] init];
    [self addChildVC:profile title:@"我" image:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    
//    self.tabBar.backgroundImage = [UIImage imageWithImageName:@"tabbar_background"];
    self.delegate = self;
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


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self changeTabBarLabelTextColor];
}


- (void)changeTabBarLabelTextColor
{
    NSUInteger i = 0;
    for (UIView *buttons in self.tabBar.subviews) {
        if (![buttons isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
        for (UIView *btnSubs in buttons.subviews) {
            UILabel *label = nil;
            if ([btnSubs isKindOfClass:[UILabel class]]) {
                label = (UILabel *)btnSubs;
            }
            if (i == self.selectedIndex) { //选中的那个按钮
                label.textColor = [UIColor orangeColor];
            }
            else{ //不是选中那个按钮
                label.textColor = [UIColor lightGrayColor];
            }
        }
        
        i++;
    }
}

-  (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    [self changeTabBarLabelTextColor];
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
