//
//  WDTools.h
//  WDMovie
//
//  Created by WindyZhang on 2018/2/6.
//  Copyright © 2018年 feeyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDTools : NSObject

+ (NSString *)getBirthdayFromIdentityCard:(NSString *)numberStr;
+ (NSString *)getAgeFromIdentityCard:(NSString *)numberStr;
+ (NSString *)getSexFromIdentityCard:(NSString *)numberStr;

+ (void)addCookiesToRequest:(NSMutableDictionary *)cookieDic cookieDomain:(NSString *)domain;
+ (void)addCookiesToRequest:(NSMutableDictionary *)cookieDic originURL:(NSString *)originUrl;
+ (void)deleteBaseCookie:(NSString *)cookieName;
+ (void)deleteAllCookie;

@end
