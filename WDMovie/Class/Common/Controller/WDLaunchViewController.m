//
//  WDLaunchViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/8/16.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDLaunchViewController.h"

@interface WDLaunchViewController ()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)NSMutableArray *imageArray;
@property(nonatomic,assign)NSInteger index;
@property (nonatomic,copy)WDBlock completionBlock;
@end

static WDLaunchViewController *launchVC = nil;

@implementation WDLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_imageView];
    if (SCREEN_WIDTH == 375 && [UIScreen mainScreen].scale == 2) {
        _imageView.image = [UIImage imageNamed:@"lunch_for6"];
    } else {
        _imageView.image = [UIImage imageNamed:@"lunch"];
    }
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    [self loadImageViews];
    [self startAnimation];
}
- (void)loadImageViews{
    CGFloat width = SCREEN_WIDTH/4;
    CGFloat height = SCREEN_HEIGHT/6;
    _imageArray = [[NSMutableArray alloc]initWithCapacity:24];
    CGFloat x = 0;
    CGFloat y = 0;
    for (int i = 0; i < 24; i++) {
        NSString *imageName = [NSString stringWithFormat:@"Movie%d",i+1];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        imageView.alpha = 0;//设置透明度
        if (i <= 3) {
            x = i*width;
            y = 0;
        }
        else if(i <= 7){
            x = SCREEN_WIDTH - width;
            y = (i - 3)*height;
        }
        else if(i <= 11){
            x = SCREEN_WIDTH - (i - 7)*width;
            y = SCREEN_HEIGHT - height;
        }
        else if(i <= 15){
            x = 0;
            y = SCREEN_HEIGHT - (i - 10)*height;
        }
        else if(i <= 17){
            x = (i - 15)*width;
            y = height;
        }
        else if(i <= 20){
            x = 2*width;
            y = (i - 16)*height;
        }
        else if(i <= 23){
            x = width;
            y = SCREEN_HEIGHT - (i - 19)*height;
        }
        //计算图片视图的坐标
        imageView.frame = CGRectMake(x, y, width, height);
        [self.view addSubview:imageView];
        [_imageArray addObject:imageView];
        
    }
    
}
- (void)startAnimation{
    if (_index == _imageArray.count) {
        [self removeLaunchVC];
        if (self.completionBlock) {
            self.completionBlock();
        }
        //跳出循环
        return;
    }
    UIImageView *imageView = _imageArray[_index];
    [UIView animateWithDuration:.05 animations:^{
        imageView.alpha = 1;
    }];
    _index++;
    [self performSelector:@selector(startAnimation) withObject:nil afterDelay:0.1];
    
}
- (void)removeLaunchVC{
    [[UIApplication sharedApplication] setStatusBarHidden:NO
                                            withAnimation:UIStatusBarAnimationNone];
    @weakify(self);
    [UIView animateWithDuration:0.3
                     animations:^{
                         @strongify(self);
                         self.view.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         @strongify(self);
                         [self.view removeFromSuperview];
                         launchVC = nil;
                     }];
}
+ (void)judgeLaunchInWindow:(UIWindow *)window completeBlock:(WDBlock)block{
    WDLaunchViewController *launchVC = [[WDLaunchViewController alloc]init];
    launchVC.completionBlock = block;
    launchVC.view.frame = [UIScreen mainScreen].bounds;
    [window addSubview:launchVC.view];
}
//隐藏状态栏
- (BOOL)prefersStatusBarHidden{
    return YES;
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

@end
