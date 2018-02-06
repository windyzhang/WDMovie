//
//  NSString+Operation.m
//  WDMovie
//
//  Created by WindyZhang on 2016/12/22.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "NSString+Operation.h"

@implementation NSString (Operation)

- (BOOL)isEmptyOrNil {
    NSString *str = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([str isEqualToString:@""] || !str) {
        return YES;
    } else {
        return NO;
    }
}
- (BOOL)haveString:(NSString *)string{
    return [self rangeOfString:string].location != NSNotFound;
}

- (BOOL)isChinese{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

- (BOOL)includeChinese {
    for (int i = 0; i < [self length]; i++) {
        int a = [self characterAtIndex:i];
        if (a > 0x4e00 && a < 0x9fff) {
            return YES;
        }
    }
    return NO;
}

@end
