//
//  NSTimer+block.m
//  WDMovie
//
//  Created by WindyZhang on 16/9/28.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "NSTimer+block.h"

@implementation NSTimer (block)

+ (NSTimer *)wd_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                     withBlock:(WDBlock)block
                                   withRepeats:(BOOL)repeats {
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(wd_blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}

+ (void)wd_blockInvoke:(NSTimer *)timer {
    WDBlock block = timer.userInfo;
    if (block) {
        block();
    }
}

@end
