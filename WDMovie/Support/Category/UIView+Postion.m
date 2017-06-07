//
//  UIView+Postion.m
//  WDMovie
//
//  Created by WindyZhang on 2017/6/7.
//  Copyright © 2017年 feeyo. All rights reserved.
//

#import "UIView+Postion.h"

@implementation UIView (Postion)

- (UIViewController *)viewController
{
    for (UIView *next = self; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (UINavigationController *)navigationController
{
    return self.viewController.navigationController;
}

@end
