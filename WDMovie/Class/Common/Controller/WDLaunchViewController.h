//
//  WDLaunchViewController.h
//  WDMovie
//
//  Created by WindyZhang on 16/8/16.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDBaseViewController.h"

@interface WDLaunchViewController : WDBaseViewController

+ (void)judgeLaunchInWindow:(UIWindow *)window completeBlock:(WDBlock)block;

@end
