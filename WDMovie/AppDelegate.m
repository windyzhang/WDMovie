//
//  AppDelegate.m
//  WDMovie
//
//  Created by WindyZhang on 16/8/9.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "AppDelegate.h"
#import "WDNavigationViewController.h"
#import "WDLaunchViewController.h"
#import "WDWelcomeViewController.h"
#import "WDLocationManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.sideBarVC = [[WDSideBarViewController alloc]init];
    self.mainTabBarC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:kMainTabBar];
    self.drawer = [[ICSDrawerController alloc]initWithLeftViewController:self.sideBarVC centerViewController:self.mainTabBarC];
    self.window.rootViewController = self.drawer;
    
    WD_LOCATION_MANAGER;
    
    BOOL isFrist = [USER_DEFAULTS boolForKey:kFirstLogin];
    if (!isFrist) {
        [USER_DEFAULTS setBool:YES forKey:kFirstLogin];
        @weakify(self);
        WDBlock blockAfterWelcomePage = ^(){
            @strongify(self);
            self.window.rootViewController = self.drawer;
        };
        [WDWelcomeViewController judgeWelcomeInWindow:self.window completeBlock:^{
            blockAfterWelcomePage();
        }];
    }else{
        [USER_DEFAULTS setBool:NO forKey:kFirstLogin];
        @weakify(self);
        WDBlock blockAfterLaunchPage = ^(){
            @strongify(self);
            self.window.rootViewController = self.drawer;
        };
        [WDLaunchViewController judgeLaunchInWindow:self.window completeBlock:^{
            blockAfterLaunchPage();
        }];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
