//
//  NSArray+YJInfo.h
//  WDMovie
//
//  Created by WindyZhang on 2017/2/7.
//  Copyright © 2017年 feeyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (YJInfo)
//防止数组越界
- (id)objectAt:(NSUInteger)index;

@end
