//
//  WDTools.m
//  WDMovie
//
//  Created by WindyZhang on 2018/2/6.
//  Copyright © 2018年 feeyo. All rights reserved.
//

#import "WDTools.h"

@implementation WDTools

+ (NSString *)getBirthdayFromIdentityCard:(NSString *)numberStr {
    NSMutableString *result = [NSMutableString stringWithCapacity:0];
    if (numberStr.length != 18) {
        return result;
    }
    NSString *year = [numberStr substringWithRange:NSMakeRange(6, 4)];
    NSString *month = [numberStr substringWithRange:NSMakeRange(10, 2)];
    NSString *day = [numberStr substringWithRange:NSMakeRange(12, 2)];
    [result appendString:year];
    [result appendString:@"-"];
    [result appendString:month];
    [result appendString:@"-"];
    [result appendString:day];
    return result;
}
+ (NSString *)getAgeFromIdentityCard:(NSString *)numberStr {
    NSString *birthday = [self getBirthdayFromIdentityCard:numberStr];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *birthdayDate = [formatter dateFromString:birthday];
    NSTimeInterval dateDiff = [birthdayDate timeIntervalSinceNow];
    int age = trunc(dateDiff / (60 * 60 * 24)) / 365;
    return [NSString stringWithFormat:@"%d",-age];
}
+ (NSString *)getSexFromIdentityCard:(NSString *)numberStr {
    if (numberStr.length != 18) {
        return @"";
    }
    int sexInt = [[numberStr substringWithRange:NSMakeRange(16, 1)] intValue];
    if (sexInt % 2 != 0) {
        return @"1";//男
    } else {
        return @"2";//女
    }
}

+ (void)addCookiesToRequest:(NSMutableDictionary *)cookieDic cookieDomain:(NSString *)domain {
    
    NSEnumerator *enumeratorKey = [cookieDic keyEnumerator];
    for (NSObject *key in enumeratorKey) {
        NSDictionary *properties = [NSDictionary dictionaryWithObjectsAndKeys:domain, NSHTTPCookieDomain, @"/", NSHTTPCookiePath, [NSString stringWithFormat:@"%@",key],NSHTTPCookieName, [NSDate dateWithTimeIntervalSinceNow:30 * 24 * 3600], NSHTTPCookieExpires, [NSString stringWithFormat:@"%@",[cookieDic objectForKey:key]],NSHTTPCookieValue,nil];
        NSHTTPCookie *userInfoCookie = [NSHTTPCookie cookieWithProperties:properties];
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:userInfoCookie];
    }
}
+ (void)addCookiesToRequest:(NSMutableDictionary *)cookieDic originURL:(NSString *)originUrl {
    
    NSEnumerator *enumeratorKey = [cookieDic keyEnumerator];
    for (NSObject *key in enumeratorKey) {
        NSDictionary *properties = [NSDictionary dictionaryWithObjectsAndKeys:originUrl,NSHTTPCookieOriginURL, @"/", NSHTTPCookiePath, [NSString stringWithFormat:@"%@",key],NSHTTPCookieName, [NSDate dateWithTimeIntervalSinceNow:30 * 24 * 3600], NSHTTPCookieExpires, [NSString stringWithFormat:@"%@",[cookieDic objectForKey:key]],NSHTTPCookieValue,nil];
        NSHTTPCookie *userInfoCookie = [NSHTTPCookie cookieWithProperties:properties];
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:userInfoCookie];
    }
}
+ (void)deleteBaseCookie:(NSString *)cookieName {
    
    NSArray *cookieArray = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    for (int i = 0; i < cookieArray.count; i++) {
        NSHTTPCookie *cookie = cookieArray[i];
        if ([cookie.name isEqualToString:cookieName]) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
            break;
        }
    }
}
+ (void)deleteAllCookie {
    
    NSArray *cookieArray = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    for (int i = 0; i < cookieArray.count; i++) {
        NSHTTPCookie *cookie = cookieArray[i];
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
}

@end
