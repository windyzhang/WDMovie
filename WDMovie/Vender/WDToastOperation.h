//
//  WDToastOperation.h
//  WDMovie
//
//  Created by WindyZhang on 2017/1/4.
//  Copyright © 2017年 feeyo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, WDToastType) {
    WDToastSucceed,
    WDToastFailed,
    WDToastNoPicture
};

@interface WDToastOperation : NSObject

+ (void)showToast:(WDToastType)toastType
         withText:(NSString*)infoString;

+ (void)showBottomToast:(WDToastType)toastType
               withText:(NSString*)infoString;

+ (void)showToastByFadeAnimation:(NSString*)infoString;

+ (void)showToast:(WDToastType)toastType
         withText:(NSString *)infoString
  completionBlock:(void (^)(void))completion;

@end
