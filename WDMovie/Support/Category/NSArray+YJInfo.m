//
//  NSArray+YJInfo.m
//  WDMovie
//
//  Created by WindyZhang on 2017/2/7.
//  Copyright © 2017年 feeyo. All rights reserved.
//

#import "NSArray+YJInfo.h"

@implementation NSArray (YJInfo)

- (id)objectAt:(NSUInteger)index{
    if (index < self.count) {
        return self[index];
    } else {
        return nil;
    }
}

@end
