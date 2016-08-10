//
//  WDSingleton.h
//  WDMovie
//
//  Created by WindyZhang on 16/8/10.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#pragma once

#define WDSingleton(className)\
\
+ (instancetype)shared##className\
{\
static className *shared##className = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
shared##className = [[className alloc] init];\
});\
return shared##className;\
}\




