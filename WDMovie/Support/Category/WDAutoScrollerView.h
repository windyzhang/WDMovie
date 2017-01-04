//
//  WDAutoScrollerView.h
//  WDMovie
//
//  Created by WindyZhang on 16/9/28.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WDAutoScrollerView;

@protocol WDAutoScrollerViewDelegate <NSObject>
@optional

- (void)loopViewDidSelectedImage:(WDAutoScrollerView *)loopView withIndex:(int)index;

@end

@interface WDAutoScrollerView : UIView

@property (nonatomic, weak) id<WDAutoScrollerViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame
                   withImages:(NSArray*)images
                 withAutoPlay:(BOOL)isAuto
                    withDelay:(NSTimeInterval)timeInterval;

@end
