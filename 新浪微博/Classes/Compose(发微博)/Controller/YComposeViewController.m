//
//  YComposeViewController.m
//  新浪微博
//
//  Created by 杨少伟 on 15/10/12.
//  Copyright © 2015年 YCompany. All rights reserved.
//

#import "YComposeViewController.h"
#import "YImagePicker.h"
#import "YTextView.h"
#import "YComposeToolBar.h"
#import "YStatusesTool.h"

@interface YComposeViewController () <YComposeToolBarDelegate,UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic,weak) YTextView *textView;
@property (nonatomic,weak) YComposeToolBar *toolBar;
@property (nonatomic,weak) YImagePicker *picker;
@end

@implementation YComposeViewController

#pragma mark - 控制器生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpNavigationBar];
    [self setUpTextView];
    [self setUpToolBar];
    [self setUpImagePicker];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 导航栏按钮监听
- (void)cancel
{
    //让键盘先消失
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)send
{
    NSString *text = self.textView.text;
    NSArray *images = self.picker.images;
    UIImage *image =  nil;
    if (images != nil) {
        image = [images firstObject];
    }
    
    [self publishWeiboWithText:text withImage:image];
    [self dismissViewControllerAnimated:YES completion:nil];
}
/**
 *  设置导航栏相关属性
 */
- (void)setUpNavigationBar{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"发微博";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStylePlain target:self action:@selector(send)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

//设置文本框
- (void)setUpTextView{
    YTextView *textView = [[YTextView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:textView];
    self.textView = textView;
    textView.placeHolder = @"分享新鲜事...";
    
    //设置垂直方向上始终能够滚动
    self.textView.alwaysBounceVertical = YES;
    self.textView.delegate = self;
    
    //监听键盘事件
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
    
}
//设置图片控件
- (void)setUpImagePicker{
    YImagePicker *picker = [[YImagePicker alloc] init];
    [self.textView addSubview:picker];
    picker.frame = self.textView.bounds;
    picker.y = 70;
    self.picker = picker;
    picker.hidden = YES;
}

//设置工具条
- (void)setUpToolBar{
    YComposeToolBar *toolBar = [[YComposeToolBar alloc] initWithFrame:CGRectMake(0, self.view.height - 44, self.view.width, 44)];
    toolBar.delegate = self;
    self.toolBar = toolBar;
    [self.view addSubview:toolBar];
    //    self.textView.inputAccessoryView = toolBar;
}



#pragma mark - 处理键盘事件
- (void)keyboardWillShowNotification:(NSNotification *)notification
{
    //    UIKeyboardAnimationDurationUserInfoKey = "0.25";
    //    UIKeyboardFrameEndUserInfoKey = "NSRect: {{0, 315}, {320, 253}}";
    //    NSLog(@"%@",notification.userInfo);
    
    NSDictionary *userInfo = notification.userInfo;
    CGRect endRect = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        self.toolBar.y = endRect.origin.y - self.toolBar.height;
    }];
    
    
}

- (void)keyboardWillHideNotification:(NSNotification *)notification
{
    NSDictionary *userInfo = notification.userInfo;
    CGRect endRect = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        self.toolBar.y = endRect.origin.y - self.toolBar.height;
    }];
}

#pragma mark - textView的代理方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

- (void)textViewDidChange:(UITextView *)textView{
        self.navigationItem.rightBarButtonItem.enabled = textView.text.length != 0;
    
}



#pragma mark - 工具条的代理方法
-(void)composeToolBar:(YComposeToolBar *)toolBar didClickButtonType:(YComposeToolBarType)type
{
    switch (type) {
        case YComposeToolBarTypePicture:
            [self openAlbum];
            break;
        case YComposeToolBarTypeMention:
            
            break;
        case YComposeToolBarTypeTopic:
            NSLog(@"#");
            break;
        case  YComposeToolBarTypeTakePicture:
            [self takePicture];
        default:
            break;
    }
}

#pragma mark - 工具条点击某项后的一些方法
- (void)openAlbum{
    //进入媒体库选择图片或者视频
    [self pickMediaFromSource:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
}
- (void)takePicture{
    //打开摄像头 拍照片或者拍视频
    [self pickMediaFromSource:UIImagePickerControllerSourceTypeCamera];
}


//根据传入的sourceType决定拍照还是进入相册选取图片
- (void)pickMediaFromSource:(UIImagePickerControllerSourceType)sourceType
{
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:sourceType];
    if ([UIImagePickerController isSourceTypeAvailable:sourceType] && mediaTypes.count > 0) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.mediaTypes = mediaTypes;
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:nil];
    }
    else{
        //弹出对话框
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"相机不可用" delegate:nil cancelButtonTitle:@"返回" otherButtonTitles:nil, nil];
        [alert show];
    }
}

#pragma mark - 照片选取的代理方法

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *lastChosenMediaType = info[UIImagePickerControllerMediaType];
    if ([lastChosenMediaType isEqualToString:(NSString *)kUTTypeImage]) {
        self.picker.hidden = NO;
        UIImage *image = info[UIImagePickerControllerEditedImage];
        [self.picker addImage:image];
        
    }
    else if ([lastChosenMediaType isEqualToString:(NSString *)kUTTypeMovie]){
        //        self.movieURL = info[UIImagePickerControllerMediaURL];
        
    }
    //返回界面
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //用户取消
    [picker dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - 发表微博的封装
- (void)publishWeiboWithText:(NSString *)text withImage:(UIImage *)image
{
    YNewStatusParams *params = [YNewStatusParams params];
    params.status = text;
    __weak __typeof(self)weakSelf = self;
    if (image == nil) {
        //发文字
        [YStatusesTool pulishStatusWithParams:params success:^(YNewStatusResult *result) {
            [MBProgressHUD showSuccess:@"发送成功!"];
            [weakSelf cancel];
        } failure:^(NSError *error) {
             [MBProgressHUD showError:@"发送失败!"];
        }];
    }
    else{
        //发图片
        NSData *imageData = UIImageJPEGRepresentation(image, 1);
        [YStatusesTool pulishStatusWithParams:params constructingBodyWithBlock:^(YFileFormData *formData){
            formData.name = @"pic";
            formData.data = imageData;
            formData.fileName = @"yimage.jpg";
            formData.mimeType = @"image/jpeg";
        } success:^(id responseObj) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showSuccess:@"发送成功!"];
            [weakSelf cancel];
        } failure:^(NSError *error) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"发送失败!"];
        }];
    }
    
    
    

   
}


@end
