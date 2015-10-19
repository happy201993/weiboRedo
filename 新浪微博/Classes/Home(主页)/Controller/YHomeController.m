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
#import "YPopMenu.h"
#import "YPrompt.h"
#import "YRefreshFooter.h"
#import "YStatusesTool.h"
#import "YUserTool.h"


@interface YHomeController () <YPopMenuDelegate>

@property (nonatomic,strong) NSMutableArray *statuses;
@property (nonatomic,weak) YRefreshFooter *footer;
@property (nonatomic,weak) YTitleButton *titleView;

@end

@implementation YHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureNaviBar];
    [self configureRefreshControl];
    [self configureRefreshFooter];
    
}

#pragma mark - 数据懒加载
- (NSMutableArray *)statuses
{
    if (_statuses == nil) {
        _statuses = [NSMutableArray array];
    }
    return _statuses;
}


/**
 *  配置刷新控件
 */
- (void)configureRefreshControl{
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(loadNewData) forControlEvents:UIControlEventValueChanged];
    [self.refreshControl beginRefreshing];
    [self loadNewData];
}
/**
 *  配置刷新底部栏
 */
- (void)configureRefreshFooter{
    YRefreshFooter *footer = [YRefreshFooter refreshFooter];
    self.tableView.tableFooterView = footer;
    self.footer = footer;
}


/**
 *  配置导航栏
 */
- (void)configureNaviBar{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_friendsearch" selectedImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendSearch)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_pop" selectedImageName:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
    
    YTitleButton *titleView = [YTitleButton  titleButton];
    self.titleView = titleView;
    titleView.height = 35;
    NSString *nickName = [YAccountVersionTool account].screen_name;
    if (nickName == nil) {
        nickName = @"首页";
    }
    [titleView setTitle:nickName forState:UIControlStateNormal];
    
    [titleView setImage:[UIImage imageWithImageName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    
    //设置选中时的背景
    UIImage *selectedBackground = [UIImage resizeImage:@"navigationbar_filter_background_highlighted"];
    [titleView setBackgroundImage:selectedBackground forState:UIControlStateHighlighted];
    
    //处理点击事件
    [titleView addTarget:self action:@selector(titleViewAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleView;
    
    [self loadUserInfo];
}





#pragma mark - 监听按钮动作
- (void)friendSearch{
   
    FirstController *first = [[FirstController alloc] init];
    [self.navigationController pushViewController:first animated:YES];
}
- (void)pop{
   
}

- (void)titleViewAction:(YTitleButton *)button{
#warning bug --  同一张图片的内存地址不同
    //    YLog(@"currentImage %@, downImage %@",button.currentImage,downImage);
    [button setImage:[UIImage imageWithImageName:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    YPopMenu *menu = [YPopMenu popMenuWithContentView:btn];
    menu.delegate = self;
    
    CGFloat menuY = 55;
    CGFloat menuW = 200;
    CGFloat menuH = 300;
    CGFloat menuX = YScreenWidth/2 - menuW/2;
    CGRect rect = CGRectMake(menuX, menuY, menuW, menuH);
    [menu showInRect:rect];
    
}

#pragma mark - 加载数据
- (void)loadNewData{
    YStatusParams *params = [[YStatusParams alloc] init];
    params.access_token = [YAccountVersionTool account].access_token;
    params.since_id = [[self.statuses firstObject] ID];
    [YStatusesTool loadWeiboStatusWithParams:params success:^(YStatusResult *result) {
        [self.refreshControl endRefreshing];
        NSArray *status = result.statuses;
        [self showPromptWithWBCount:status.count];
        if (status.count == 0) return;
        //把最新的数据插入到数组最前面
        NSRange range = NSMakeRange(0, status.count);
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        [self.statuses insertObjects:status atIndexes:indexSet];
        [self.tableView reloadData];
        
     }failure:^(NSError *error)
     {
         YLog(@"error -- %@",error);
         [self.refreshControl endRefreshing];
     }];
}

- (void)loadMoreData{
    YStatusParams *params = [[YStatusParams alloc] init];
    params.access_token = [YAccountVersionTool account].access_token;
    NSInteger maxId = [[[self.statuses lastObject] ID] integerValue] - 1;
    params.max_id = [NSNumber numberWithInteger:maxId];
    [YStatusesTool loadWeiboStatusWithParams:params success:^(YStatusResult *result) {
        [self.footer endRefresh];
        NSArray *status = result.statuses;
        if (status.count == 0) return;
        [self.statuses addObjectsFromArray:status];
        [self.tableView reloadData];
        
    }failure:^(NSError *error)
     {
         YLog(@"error -- %@",error);
         [self.footer endRefresh];
     }];
    
}

/**
 *  加载用户数据
 */
- (void)loadUserInfo
{
//    access_token	false	string	采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得。
//    uid	false	int64	需要查询的用户ID。
//    screen_name	false	string	需要查询的用户昵称。
//    注意事项
//    参数uid与screen_name二者必选其一，且只能选其一；
//    接口升级后，对未授权本应用的uid，将无法获取其个人简介、认证原因、粉丝数、关注数、微博数及最近一条微博内容。
    
    YUserParams *params = [[YUserParams alloc] init];
    params.access_token = [YAccountVersionTool account].access_token;
    params.uid = [YAccountVersionTool account].uid;
    [YUserTool loadUserInfoWithParams:params success:^(YUser *user) {
        YAccount *account = [YAccountVersionTool account];
        account.screen_name = user.screen_name;
        //将最新的昵称保存到沙盒
        [YAccountVersionTool  writeAccountToDisk:account];
        [self.titleView setTitle:user.screen_name forState:UIControlStateNormal];
    } failure:^(NSError *error) {
        YLog(@"home --- loadUserInfo---%@",error);
    }];
}


#pragma mark - 显示更新微博的提示
- (void)showPromptWithWBCount:(NSInteger)count
{
    NSString *text = nil;
    if (count == 0) {
        text = @"暂无更新微博";
    }else{
        text = [NSString stringWithFormat:@"更新了%li条微博数据",count];
    }
    YPrompt *prompt = [YPrompt promptWithText:text];
    prompt.width = self.view.width;
    prompt.height = 35;
    prompt.y = 64 - prompt.height;
    [self.navigationController.view insertSubview:prompt belowSubview:self.navigationController.navigationBar];
 
    NSTimeInterval duration = 0.8;
    [UIView animateWithDuration:duration animations:^{
        prompt.transform = CGAffineTransformMakeTranslation(0, prompt.height);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration delay:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
             prompt.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
             [prompt removeFromSuperview];
        }];
    }];
}


#pragma mark - tableView的数据源及代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = self.statuses.count;
    tableView.tableFooterView.hidden = count == 0;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1 创建cell
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    YStatuse *statuse = self.statuses[indexPath.row];
    
    //2 设置模型
    cell.textLabel.text = statuse.text;
    cell.detailTextLabel.text = statuse.user.screen_name;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:statuse.user.profile_image_url] placeholderImage:[UIImage imageWithImageName:@"avatar_default"]];
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)popMenuDidDismiss:(YPopMenu *)menu
{
    UIImage *downImage = [UIImage imageWithImageName:@"navigationbar_arrow_down"];
    YTitleButton *button = (YTitleButton *)self.navigationItem.titleView;
     [button setImage:downImage forState:UIControlStateNormal];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.footer.isRefreshing || self.statuses.count == 0) {
        return;
    }
    CGFloat delta = self.view.height - self.tabBarController.tabBar.height;
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat contentH = scrollView.contentSize.height;
    CGFloat left = contentH - offsetY;
    if (left <= delta) {
        YLog(@"-----------------");
        [self.footer beginRefresh];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self loadMoreData];
        });
        
    }
    
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
