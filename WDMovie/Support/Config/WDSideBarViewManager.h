//
//  WDSideBarViewManager.h
//  WDMovie
//
//  Created by WindyZhang on 16/9/8.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDMainTabBarController.h"
#import "WDSideBarViewController.h"

#define WD_SIDEBARVIEW_MANAGER [WDSideBarViewManager sharedWDSideBarViewManager]

@interface WDSideBarViewManager : NSObject

@property(nonatomic,strong)WDMainTabBarController *mainTabBarController;
@property(nonatomic,strong)WDSideBarViewController *sideBarViewController;

- (void)pushViewController:(UIViewController *)viewController;
- (void)presentViewController:(UIViewController *)viewControllerToPresent
                     animated:(BOOL)flag
                   completion:(void (^)(void))completion;

+ (WDSideBarViewManager *)sharedWDSideBarViewManager;

@end
