//
//  WDWelcomeViewController.h
//  WDMovie
//
//  Created by WindyZhang on 16/8/16.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDBaseViewController.h"

@interface WDWelcomeViewController : WDBaseViewController
+ (void)judgeWelcomeInWindow:(UIWindow *)window completeBlock:(WDBlock)block;
@end
