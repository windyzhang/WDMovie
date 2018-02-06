//
//  WDAlertView.h
//  WDMovie
//
//  Created by WindyZhang on 2018/2/6.
//  Copyright © 2018年 feeyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDAlertView : NSObject

+ (void)alertInViewController:(UIViewController *)viewController message:(NSString *)message;

+ (void)showAlertViewTip:(NSString *)title message:(NSString *)message cancelButton:(NSString *)cancel otherButtons:(NSArray *)titles inViewController:(UIViewController *)viewController selectAt:(WDIntegerBlock)block;

@end
