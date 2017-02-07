//
//  UIViewController+Status.m
//  WDMovie
//
//  Created by WindyZhang on 2016/12/22.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "UIViewController+Status.h"

@implementation UIViewController (Status)

- (void)setNavigationBarStyle:(CustomBarStyle)style{
    switch (style) {
        case WhiteStyle: {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
            [self setupNavbarBackgroundWithColor:[UIColor whiteColor]];
            [self setupNavbarBackgroundWithImage:nil];
            self.navigationController.navigationBar.translucent = NO;
            self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
            self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor],
                                                                            NSFontAttributeName : [UIFont boldSystemFontOfSize:18]};
            self.navigationController.navigationBar.tintColor = WD_COLOR.navBarItem;
        }
            break;
        case LightStyle: {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
            [self setupNavbarBackgroundWithColor:[UIColor whiteColor]];
            [self setupNavbarBackgroundWithImage:nil];
            self.navigationController.navigationBar.translucent = YES;
            self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
            self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor],
                                                                            NSFontAttributeName:[UIFont boldSystemFontOfSize:18]};
            self.navigationController.navigationBar.tintColor = WD_COLOR.navBarItem;
        }
            break;
        case DarkStyle: {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
            [self setupNavbarBackgroundWithColor:COLOR_WITH_HEX(0x323535ff)];
            self.navigationController.navigationBar.translucent = YES;
            self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                            NSFontAttributeName:[UIFont boldSystemFontOfSize:18]};
            self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        }
            break;
        case ClearStyle: {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navClear"] forBarMetrics:UIBarMetricsDefault];
            self.navigationController.navigationBar.shadowImage = [UIImage imageNamed:@"navClear"];
            self.navigationController.navigationBar.translucent = YES;
            self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                            NSFontAttributeName:[UIFont boldSystemFontOfSize:18]};
            self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        }
            break;
        case HistoryStyle: {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
            [self.navigationController.navigationBar setBackgroundImage:[[UIImage imageWithColor:WD_COLOR.navBarItem
                                                                                            size:CGSizeMake(SCREEN_WIDTH, 64)]
                                                                         imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                          forBarMetrics:UIBarMetricsDefault];
            self.navigationController.navigationBar.translucent = NO;
            self.navigationController.navigationBar.shadowImage = [UIImage imageWithColor:WD_COLOR.navBarItem size:CGSizeMake(SCREEN_WIDTH, 1)];
            self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                            NSFontAttributeName:[UIFont boldSystemFontOfSize:18]};
            self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        }
            break;
        case MapStyle: {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navClear"] forBarMetrics:UIBarMetricsDefault];
            self.navigationController.navigationBar.shadowImage = [UIImage imageNamed:@"navClear"];
            self.navigationController.navigationBar.translucent = YES;
            self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
            self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor],
                                                                            NSFontAttributeName:[UIFont boldSystemFontOfSize:18]};
            self.navigationController.navigationBar.tintColor = WD_COLOR.navBarItem;
        }
            break;
        case MeterMapStyle: {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_map"] forBarMetrics:UIBarMetricsDefault];
            self.navigationController.navigationBar.shadowImage = [UIImage imageNamed:@"navClear"];
            self.navigationController.navigationBar.translucent = YES;
            self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                            NSFontAttributeName:[UIFont boldSystemFontOfSize:18]};
            self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        }
            break;
        case FlowStyle: {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
            [self setupNavbarBackgroundWithColor:COLOR_WITH_HEX(0x43454aff)];
            self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                            NSFontAttributeName:[UIFont boldSystemFontOfSize:18]};
            self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        }
            break;
        case BlackStyle: {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
            [self setupNavbarBackgroundWithColor:COLOR_WITH_HEX(0x333333ff)];
            self.navigationController.navigationBar.translucent = NO;
            self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                            NSFontAttributeName:[UIFont boldSystemFontOfSize:18]};
            self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        }
            break;
        case DarkBlackStyle: {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
            [self setupNavbarBackgroundWithColor:COLOR_WITH_HEX(0x212424ff)];
            self.navigationController.navigationBar.translucent = NO;
            self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                            NSFontAttributeName:[UIFont boldSystemFontOfSize:18]};
            self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        }
    }
}
- (void)setupNavbarBackgroundWithImage:(UIImage*)image{
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = image;
}

- (void)setupNavbarBackgroundWithColor:(UIColor*)color{
    self.navigationController.navigationBar.barTintColor = color;
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
}

- (void)setupPromptNavbarBackgroundWithImage:(UIImage *)image{
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefaultPrompt];
    self.navigationController.navigationBar.shadowImage = image;
}

- (void)setupPromptNavbarBackgroundWithColor:(UIColor *)color{
    self.navigationController.navigationBar.barTintColor = color;
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefaultPrompt];
}

@end
