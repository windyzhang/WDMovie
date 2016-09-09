//
//  WDSideBarViewManager.m
//  WDMovie
//
//  Created by WindyZhang on 16/9/8.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDSideBarViewManager.h"
#import "AppDelegate.h"

@implementation WDSideBarViewManager

WDSingleton(WDSideBarViewManager);

- (id)init{
    self = [super init];
    if (self) {
        self.mainTabBarController = [[WDMainTabBarController alloc]init];
        self.sideBarViewController = [[WDSideBarViewController alloc]init];
        AppDelegate *delegate = [UIApplication sharedApplication].delegate;
        delegate.drawer = [[ICSDrawerController alloc]initWithLeftViewController:self.sideBarViewController centerViewController:self.mainTabBarController];
    }
    return self;
}

- (void)pushViewController:(UIViewController *)viewController{
    UINavigationController *navigationC =
    self.mainTabBarController.viewControllers[self.mainTabBarController.selectedIndex];
    viewController.hidesBottomBarWhenPushed = YES;
    [navigationC pushViewController:viewController animated:NO];
}
- (void)presentViewController:(UIViewController *)viewControllerToPresent
                     animated:(BOOL)flag
                   completion:(void (^)(void))completion{
    [self.sideBarViewController presentViewController:viewControllerToPresent
                                             animated:flag
                                           completion:completion];
    
}
@end
