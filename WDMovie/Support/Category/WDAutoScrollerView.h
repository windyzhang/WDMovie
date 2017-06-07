//
//  WDAutoScrollerView.h
//  WDMovie
//
//  Created by WindyZhang on 16/9/28.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDAutoScrollerView : UIView

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray*)images autoPlay:(BOOL)isAuto delay:(NSTimeInterval)timeInterval;

@end
