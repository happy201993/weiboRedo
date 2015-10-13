//
//  YMessageController.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/5.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YMessageController.h"
#import "YComposeViewController.h"
#import "YNavigationController.h"
@interface YMessageController ()

@end

@implementation YMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发私信" style:UIBarButtonItemStylePlain target:self action:@selector(sendMessage)];
//    self.navigationItem.rightBarButtonItem.enabled = NO;
    NSLog(@"YMessageController-----------viewDidload");
}

- (void)sendMessage
{
    YLog(@"send Message");
    YComposeViewController *vc = [[YComposeViewController alloc] init];
    
    YNavigationController *navi = [[YNavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:navi animated:YES completion:nil];
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
    cell.textLabel.text = [NSString stringWithFormat:@"YMessageController --- %li",indexPath.row];
    return cell;
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
