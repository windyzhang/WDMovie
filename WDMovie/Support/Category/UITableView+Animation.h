//
//  UITableView+Animation.h
//  WDMovie
//
//  Created by WindyZhang on 16/9/28.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kBOUNCE_DISTANCE  4.f
#define kWAVE_DURATION   0.5f

typedef NS_ENUM(NSInteger,AnimationType) {
    LeftToRightWaveAnimation = -1,
    FadeAnimation = 0,
    RightToLeftWaveAnimation = 1
};

@interface UITableView (Animation)

- (void)reloadDataAnimateWithWave:(AnimationType)animation;

@end
