//
//  WDColorManager.m
//  WDMovie
//
//  Created by WindyZhang on 16/8/10.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDColorManager.h"

#define WD_LAZY_VAL(key, val) \
- (UIColor *)key {\
if (!_##key) {\
_##key = COLOR_WITH_HEX(val);\
}\
return _##key;\
}\

@implementation WDColorManager

WDSingleton(WDColorManager)

//+ (instancetype)sharedWDColorManager{
//    static WDColorManager *sharedWDColorManager = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedWDColorManager = [[WDColorManager alloc]init];
//    });
//    return sharedWDColorManager;
//}

WD_LAZY_VAL(navBarItem, 0x5196fbff)
WD_LAZY_VAL(button, 0x5196fbff)
WD_LAZY_VAL(seperate, 0xddddddff)
WD_LAZY_VAL(background, 0xf8f8f8ff)

@end
