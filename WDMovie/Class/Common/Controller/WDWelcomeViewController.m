//
//  WDWelcomeViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/8/16.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDWelcomeViewController.h"
#import "WDLaunchViewController.h"

@interface WDWelcomeViewController ()
@property(nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,copy)WDBlock completionBlock;
@end

@implementation WDWelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initScrollView];
}
- (void)initScrollView{
    //创建滑动视图
    _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*5, SCREEN_HEIGHT);//设置内容尺寸
    _scrollView.pagingEnabled = YES;//开启分页
    [self.view addSubview:_scrollView];
    for (int i = 0; i < 5; i++) {
        //创建视图
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        NSString *imageName = [NSString stringWithFormat:@"Welcome%d",i+1];
        imageView.image = [UIImage imageNamed:imageName];
        imageView.userInteractionEnabled = YES;
        [_scrollView addSubview:imageView];
        
        if (i == 4) {
            //创建按钮，切换主控制器
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(SCREEN_WIDTH/2 - 75, SCREEN_HEIGHT  -  100, 150, 40);
            button.layer.cornerRadius = 5;
            button.layer.borderColor = [UIColor colorWithRed:150 / 255.f green:55 / 255.f blue:55/ 255.f alpha:1].CGColor;
            button.layer.borderWidth = 1.5;
            button.layer.masksToBounds = YES;
            [button setTitle:@"立刻体验" forState:UIControlStateNormal];
            //设置字体
            button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
            //设置字体颜色
            [button setTitleColor:[UIColor colorWithRed:150 / 255.f green:55 / 255.f blue:55/ 255.f alpha:1] forState:UIControlStateNormal];
            [button addTarget:self
                       action:@selector(clickButton:)
             forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:button];
        }
    }
    
}
- (void)clickButton:(UIButton*)button{
    WDLaunchViewController *launchVC = [[WDLaunchViewController alloc]init];
    //切换窗口的根视图控制器
    //方式一
    //获取应用程序
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    keyWindow.rootViewController = launchVC;
    //方式二
    //通过视图窗口的属性，获取视图所在的窗口
    // self.view.window.rootViewController = lauchVC;
}
+ (void)judgeWelcomeInWindow:(UIWindow *)window completeBlock:(WDBlock)block{
    WDWelcomeViewController *welcomeVC = [[WDWelcomeViewController alloc]init];
    welcomeVC.completionBlock = block;
    welcomeVC.view.frame = [UIScreen mainScreen].bounds;
    [window addSubview:welcomeVC.view];
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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
