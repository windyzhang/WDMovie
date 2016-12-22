//
//  NSString+Operation.m
//  WDMovie
//
//  Created by WindyZhang on 2016/12/22.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "NSString+Operation.h"

@implementation NSString (Operation)

- (void)alertInViewController:(UIViewController *)viewController{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@""
                                                                   message:self
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"我知道了"
                                              style:UIAlertActionStyleDefault
                                            handler:NULL]];
    [viewController presentViewController:alert animated:YES completion:NULL];
}

- (BOOL)isEmptyOrNil {
    NSString *str = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([str isEqualToString:@""] || !str) {
        return YES;
    } else {
        return NO;
    }
}
@end
