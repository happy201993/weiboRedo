//
//  FirstController.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/6.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "FirstController.h"
#include "SecondController.h"
@interface FirstController ()

- (IBAction)push:(id)sender;

@end

@implementation FirstController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)push:(id)sender {
    SecondController *vc = [[SecondController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
