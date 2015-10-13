//
//  YNewfeatureController.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/13.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YNewfeatureController.h"
#import "YTabBarController.h"

#define kImageCount 4

@interface YNewfeatureController () <UIScrollViewDelegate>
@property (nonatomic,weak) UIPageControl *pageControl;
@property (nonatomic,weak) UIScrollView *scrollView;
@property (nonatomic,weak) UIImageView *checkView;
@end

@implementation YNewfeatureController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureScrollView];
    [self configurePageControl];
    [self configureStartView];
}


- (void)configureScrollView{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    scrollView.frame = self.view.bounds;
    
    for (NSInteger i = 0 ; i < kImageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [scrollView addSubview:imageView];
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%li",i+1];
        if (FourInch) {
            imageName = [imageName stringByAppendingString:@"-568h"];
        }
        UIImage *image = [UIImage imageWithImageName:imageName];
        imageView.image = image;
        
        //position
        imageView.x = self.view.width * i;
        imageView.width = self.view.width;
        imageView.height = self.view.height;
    }
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(self.view.width * kImageCount, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor = YRGB(246, 246, 246, 1);
}

- (void)configurePageControl{
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    pageControl.width = 150;
    pageControl.height = 20;
    pageControl.midX = self.view.center.x;
    pageControl.midY = self.view.height - 30;
    
    pageControl.numberOfPages = kImageCount;
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
}


- (void)configureStartView
{
    UIView *view = [[UIView alloc] init];
    UIImageView *imageView = [[UIImageView alloc] init];
    self.checkView = imageView;
    [view addSubview:imageView];
    imageView.image = [UIImage imageWithImageName:@"new_feature_share_false"];
    imageView.size = imageView.image.size;
    
    UILabel *label = [[UILabel alloc] init];
    [view addSubview:label];
    label.font = [UIFont systemFontOfSize:20];
    label.text = @"分享给好友";
    label.x = imageView.width + 5;
    label.width = 100;
    label.height = imageView.height;
    
    [self.scrollView addSubview:view];
    
    view.width = label.width + imageView.width +10;
    view.height = imageView.height;
    view.y = self.view.height - 200;
    view.x = (kImageCount-1) * self.view.width + (self.view.width - view.width)/2;
    
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [view addGestureRecognizer:tap];
    
    
    //开始按钮
    UIButton *button = [[UIButton alloc] init];
    [self.scrollView addSubview:button];
    [button setBackgroundImage:[UIImage imageWithImageName:@"new_feature_finish_button"] forState:UIControlStateNormal];
     [button setBackgroundImage:[UIImage imageWithImageName:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    [button setTitle:@"开启微博" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(startAction) forControlEvents:UIControlEventTouchUpInside];
    
    button.size = button.currentBackgroundImage.size;
    button.x = (kImageCount-1) * self.view.width + (self.view.width - button.width)/2;
    button.y = CGRectGetMaxY(view.frame) + 20;
}


#pragma mark - 监听按钮点击事件
- (void)startAction
{
    YTabBarController *tabBarVc = [[YTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVc;
}
- (void)tapAction
{
    static BOOL selected = NO;
    UIImage *image = nil;
    if (selected) {
       image = [UIImage imageWithImageName:@"new_feature_share_false"];
    }else{
        image = [UIImage imageWithImageName:@"new_feature_share_true"];
    }
    self.checkView.image = image;
    selected = !selected;
}


#pragma mark - scrollView代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger currentPage = (scrollView.contentOffset.x / self.view.width) + 0.5;
    self.pageControl.currentPage = currentPage;
}


@end
