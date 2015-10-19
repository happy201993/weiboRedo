//
//  YNavigationController.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/5.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YNavigationController.h"
#import "UIBarButtonItem+YExtension.h"
@implementation YNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSLog(@"bar  -----  %p",self.navigationBar);
//    UINavigationBar *bar = [[UINavigationBar alloc] init];
//    [self setValue:bar forKey:@"navigationBar"];
//    NSLog(@"bar  -----  %p",self.navigationBar);
    
}

//类在加载的时候调用一次 只调用一次
+ (void)initialize
{
    [self configureNavigationItem];
}



/**
 *  调整UIBarButtonItem的外观
 */
+ (void)configureNavigationItem
{
    UIBarButtonItem *appearence = [UIBarButtonItem appearance];
    //  appearance是一个协议方法 遵守这个协议的类都可以调用这个方法 返回对象是一个UIBarItemAppearance
    
    //正常状态下的外观
    NSMutableDictionary *normalText = [NSMutableDictionary dictionary];
    normalText[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    normalText[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [appearence setTitleTextAttributes:normalText forState:UIControlStateNormal];
    
    //高亮状态下的外观
    NSMutableDictionary *highlitedText = [NSMutableDictionary dictionaryWithDictionary:normalText];
    highlitedText[NSForegroundColorAttributeName] = [UIColor redColor];
    [appearence setTitleTextAttributes:highlitedText forState:UIControlStateHighlighted];
    
    //不可点击状态下的外观
    NSMutableDictionary *disableText = [NSMutableDictionary dictionaryWithDictionary:normalText];
    disableText[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [appearence setTitleTextAttributes:disableText forState:UIControlStateDisabled];
}


//重写push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //如果栈中有控制器 那么隐藏bar
    if(self.viewControllers.count > 0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_back" selectedImageName:@"navigationbar_back_highlighted" target:self action:@selector(back)];
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_more" selectedImageName:@"navigationbar_more_highlighted" target:self action:@selector(pop)];
    }
    [super pushViewController:viewController animated:animated];
}


#pragma mark - 按钮监听
- (void)back{
    [self popViewControllerAnimated:YES];
}

- (void)pop{
    [self popToRootViewControllerAnimated:YES];
}
@end
