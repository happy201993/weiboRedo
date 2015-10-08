//
//  YHomeController.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/5.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YHomeController.h"
#import "UIBarButtonItem+YExtension.h"
#import "FirstController.h"
#import "SecondController.h"
#import "UIImage+Extension.h"
#import "YTitleButton.h"
@interface YHomeController ()

@end

@implementation YHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_friendsearch" selectedImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendSearch)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_pop" selectedImageName:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];

    YTitleButton *titleView = [YTitleButton  titleButton];
    [titleView setTitle:@"首页" forState:UIControlStateNormal];
    UIImage *arrow = [UIImage imageWithImageName:@"navigationbar_arrow_down"];
    [titleView setImage:arrow forState:UIControlStateNormal];
    
    titleView.width = 100;
    titleView.height = 35;
    
    self.navigationItem.titleView = titleView;
    
}


#pragma mark - 监听按钮动作
- (void)friendSearch
{
   
    FirstController *first = [[FirstController alloc] init];
    [self.navigationController pushViewController:first animated:YES];
}
- (void)pop
{
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1 创建cell
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    //2 设置模型
    cell.textLabel.text = [NSString stringWithFormat:@"YHomeController --- %li",indexPath.row];
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
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
