//
//  UIColor+Init.m
//  WDMovie
//
//  Created by WindyZhang on 16/8/10.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "UIColor+Init.h"

@implementation UIColor (Init)

+ (UIColor *)colorWithHex:(NSInteger)hexValue {
    CGFloat r = (float)(hexValue >> 24 & 0xFF) / 255.0;
    CGFloat g = (float)(hexValue >> 16 & 0xFF) / 255.0;
    CGFloat b = (float)(hexValue >> 8 & 0xFF) / 255.0;
    CGFloat a = (float)(hexValue & 0xFF) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    if (hexString.length != 7) {
        return [UIColor whiteColor];
    }
    
    NSRange range = NSMakeRange(1, 2);
    range.location = 1;
    NSString *rStr = [hexString substringWithRange:range];
    range.location = 3;
    NSString *gStr = [hexString substringWithRange:range];
    range.location = 5;
    NSString *bStr = [hexString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rStr] scanHexInt:&r];
    [[NSScanner scannerWithString:gStr] scanHexInt:&g];
    [[NSScanner scannerWithString:bStr] scanHexInt:&b];
    
    return [UIColor colorWithRed:r / 255.0
                           green:g / 255.0
                            blue:b / 255.0
                           alpha:1];
}
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alp{
    if (hexString.length != 7) {
        return [UIColor whiteColor];
    }
    
    NSRange range = NSMakeRange(1, 2);
    range.location = 1;
    NSString *rStr = [hexString substringWithRange:range];
    range.location = 3;
    NSString *gStr = [hexString substringWithRange:range];
    range.location = 5;
    NSString *bStr = [hexString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rStr] scanHexInt:&r];
    [[NSScanner scannerWithString:gStr] scanHexInt:&g];
    [[NSScanner scannerWithString:bStr] scanHexInt:&b];
    
    return [UIColor colorWithRed:r / 255.0
                           green:g / 255.0
                            blue:b / 255.0
                           alpha:alp];
}

@end
