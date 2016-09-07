//
//  WDWelcomeViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/8/16.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDWelcomeViewController.h"

@interface WDWelcomeViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,copy)WDBlock completeBlock;

@end

static WDWelcomeViewController *welcomeVC = nil;

@implementation WDWelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initScrollView];
}
- (void)initScrollView{
    //创建滑动视图
    _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*6, SCREEN_HEIGHT);//设置内容尺寸
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;//开启分页
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.bounces = NO;
    [self.view addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 60, SCREEN_HEIGHT - 50, 120, 30)];
    _pageControl.currentPage = 0;
    _pageControl.numberOfPages = 5;
    self.pageControl.pageIndicatorTintColor = [[UIColor alloc] initWithWhite:255 alpha:0.5];
    self.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    [self.view addSubview:_pageControl];
    
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
            [imageView addSubview:button];
            @weakify(self);
            [button setBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
                @strongify(self);
                [self removeWelcomeVC];
            }];
        }
    }
}
- (void)removeWelcomeVC{
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
                         welcomeVC = nil;
                     }];
    if (self.completeBlock) {
        self.completeBlock();
    }
}
- (void)clickButton:(UIButton*)button{
    /*
     WDLaunchViewController *launchVC = [[WDLaunchViewController alloc]init];
     //切换窗口的根视图控制器
     //方式一
     //获取应用程序
     UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
     keyWindow.rootViewController = launchVC;
     //方式二
     //通过视图窗口的属性，获取视图所在的窗口
     // self.view.window.rootViewController = lauchVC;
     */
}
+ (void)judgeWelcomeInWindow:(UIWindow *)window completeBlock:(WDBlock)block{
    welcomeVC = [[WDWelcomeViewController alloc]init];
    welcomeVC.completeBlock = block;
    welcomeVC.view.frame = [UIScreen mainScreen].bounds;
    [window addSubview:welcomeVC.view];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x == SCREEN_WIDTH * 5){//滑动图片后改变scrollView偏移量
        [self removeWelcomeVC];
    }else{
        self.pageControl.currentPage = scrollView.contentOffset.x/SCREEN_WIDTH;
    }
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
