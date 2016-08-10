//
//  UIColor+Init.h
//  WDMovie
//
//  Created by WindyZhang on 16/8/10.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import <UIKit/UIKit.h>

#define COLOR_WITH_HEX(hex) [UIColor colorWithHex:hex]

@interface UIColor (Init)

+ (UIColor *)colorWithHex:(NSInteger) hexValue;
+ (UIColor *)colorWithHexString:(NSString *) hexString;
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alp;

@end
