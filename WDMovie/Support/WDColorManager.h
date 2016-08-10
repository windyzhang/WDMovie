//
//  WDColorManager.h
//  WDMovie
//
//  Created by WindyZhang on 16/8/10.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import <Foundation/Foundation.h>

#define WD_COLOR [WDColorManager sharedWDColorManager]

@interface WDColorManager : NSObject

+ (WDColorManager *)sharedWDColorManager;

@property (nonatomic, strong) UIColor *navBarItem;
@property (nonatomic, strong) UIColor *button;
@property (nonatomic, strong) UIColor *seperate;
@property (nonatomic, strong) UIColor *background;

@end
