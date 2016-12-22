//
//  UIViewController+Status.h
//  WDMovie
//
//  Created by WindyZhang on 2016/12/22.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,CustomBarStyle) {
    WhiteStyle,
    LightStyle,
    DarkStyle,
    FlowStyle,
    ClearStyle,
    HistoryStyle,
    MapStyle,
    MeterMapStyle,
    BlackStyle,
    DarkBlackStyle
};

@interface UIViewController (Status)

- (void)setNavigationBarStyle:(CustomBarStyle)style;

@end
