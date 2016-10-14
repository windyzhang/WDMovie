//
//  Macro.h
//  WDMovie
//
//  Created by WindyZhang on 16/8/10.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#pragma once

#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define USER_DEFAULTS [NSUserDefaults standardUserDefaults]
#define WDFORMAT(format, ...) [NSString stringWithFormat:(format), ##__VA_ARGS__]

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define debugMethod() WDLog(@"%s", __func__)
#else
#define NSLog(...)
#define debugMethod()
#endif
