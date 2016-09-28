//
//  WDMainTabBarController.m
//  WDMovie
//
//  Created by WindyZhang on 16/8/9.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDMainTabBarController.h"
#import "WDMovieViewController.h"
#import "WDNewsViewController.h"
#import "WDMusicViewController.h"
#import "WDMapViewController.h"
#import "WDMoreViewController.h"
#import "WDNavigationViewController.h"

@interface WDMainTabBarController ()

@end

@implementation WDMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self setupChildControllers];
}
- (void)setupChildControllers{
    [self setupChildNavigationControllerWithClass:[WDNavigationViewController class] tabBarImageName:@"tabBar_Movie" rootViewControllerClass: [WDMovieViewController class] rootViewControllerTitle:@"电影"];
    [self setupChildNavigationControllerWithClass:[WDNavigationViewController class] tabBarImageName:@"tabBar_New" rootViewControllerClass: [WDNewsViewController class] rootViewControllerTitle:@"新闻"];
    [self setupChildNavigationControllerWithClass:[WDNavigationViewController class] tabBarImageName:@"tabBar_Map" rootViewControllerClass: [WDMapViewController class] rootViewControllerTitle:@"地图"];
    [self setupChildNavigationControllerWithClass:[WDNavigationViewController class] tabBarImageName:@"tabBar_Music" rootViewControllerClass: [WDMusicViewController class] rootViewControllerTitle:@"音乐"];
    [self setupChildNavigationControllerWithClass:[WDNavigationViewController class] tabBarImageName:@"tabBar_More" rootViewControllerClass: [WDMoreViewController class] rootViewControllerTitle:@"更多"];
    
}
- (void)setupChildNavigationControllerWithClass:(Class)class tabBarImageName:(NSString *)name rootViewControllerClass:(Class)rootViewControllerClass rootViewControllerTitle:(NSString *)title{
    UIViewController *rootVC = [[rootViewControllerClass alloc] init];
    rootVC.title = title;
    UINavigationController *navigatinVC = [[class  alloc] initWithRootViewController:rootVC];
    navigatinVC.tabBarItem.image = [UIImage imageNamed:name];
    //    navigatinVC.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_press", name]];
    [self addChildViewController:navigatinVC];
}
- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController{
    self.view.userInteractionEnabled = YES;
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
