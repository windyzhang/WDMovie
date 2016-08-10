//
//  AppDelegate.h
//  WDMovie
//
//  Created by WindyZhang on 16/8/9.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDSideBarViewController.h"
#import "WDMainTabBarController.h"
#import "ICSDrawerController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) WDSideBarViewController *sideBarVC;
@property (strong, nonatomic) ICSDrawerController *drawer;
@property (strong, nonatomic) WDMainTabBarController *mainTabBarC;


@end

