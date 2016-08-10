//
//  WDNavigationViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/8/9.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDNavigationViewController.h"

@interface WDNavigationViewController ()

@end

@implementation WDNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    [self setUpNavigationBar];
}
- (void)setUpNavigationBar{
    UIColor *backgroundColor = [UIColor colorWithRed:0.204 green:0.722 blue:0.918 alpha:1];
    [self.navigationBar setBackgroundImage:[[WDNavigationViewController CreateImageWithColor:backgroundColor] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 1, 5, 1)] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.tintColor = [UIColor whiteColor];
    //去掉导航栏下边的投影
    self.navigationBar.shadowImage = [[WDNavigationViewController CreateImageWithColor:[UIColor clearColor]] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)];
    
    self.navigationBar.barStyle = UIBarStyleBlack;
}
+ (UIImage *)CreateImageWithColor: (UIColor *) color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [viewController.navigationItem.backBarButtonItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
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
