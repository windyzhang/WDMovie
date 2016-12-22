//
//  NSTimer+block.h
//  WDMovie
//
//  Created by WindyZhang on 16/9/28.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDBlock.h"

@interface NSTimer (block)

+ (NSTimer *)wd_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                     withBlock:(WDBlock)block
                                   withRepeats:(BOOL)repeats;

@end
