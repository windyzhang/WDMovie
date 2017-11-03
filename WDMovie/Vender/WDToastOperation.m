//
//  WDToastOperation.m
//  WDMovie
//
//  Created by WindyZhang on 2017/1/4.
//  Copyright © 2017年 feeyo. All rights reserved.
//

#import "WDToastOperation.h"
#import <CRToast.h>

@implementation WDToastOperation

+ (void)showToast:(WDToastType)toastType
         withText:(NSString*)infoString{
    
    if (!infoString) return;
    [CRToastManager dismissNotification:NO];
    NSMutableDictionary *options = [@{kCRToastNotificationTypeKey               : @(CRToastTypeNavigationBar),
                                      kCRToastNotificationPresentationTypeKey   : @(CRToastPresentationTypeCover),
                                      kCRToastAutorotateKey                     : @(NO),
                                      kCRToastUnderStatusBarKey                 : @(NO),
                                      kCRToastTextColorKey                      : [UIColor whiteColor],
                                      kCRToastBackgroundColorKey                : COLOR_WITH_HEX(0x000000cc),
                                      kCRToastTextKey                           : infoString,
                                      kCRToastFontKey                           : [UIFont systemFontOfSize:15],
                                      kCRToastTextAlignmentKey                  : @(NSTextAlignmentLeft),
                                      kCRToastTimeIntervalKey                   : @(1.5),
                                      kCRToastAnimationInTypeKey                : @(CRToastAnimationTypeLinear),
                                      kCRToastAnimationOutTypeKey               : @(CRToastAnimationTypeLinear),
                                      kCRToastAnimationInDirectionKey           : @(CRToastAnimationDirectionBottom),
                                      kCRToastAnimationOutDirectionKey          : @(CRToastAnimationDirectionBottom)} mutableCopy];
    
    options[kCRToastTextAlignmentKey] = @(NSTextAlignmentCenter);
    [CRToastManager showNotificationWithOptions:options
                                 apperanceBlock:^(void) {
                                     
                                 }
                                completionBlock:^(void) {
                                    
                                }];
}

+ (void)showBottomToast:(WDToastType)toastType
               withText:(NSString*)infoString{
    
    if (!infoString) return;
    [CRToastManager dismissNotification:NO];
    NSMutableDictionary *options = [@{kCRToastNotificationTypeKey               : @(CRToastTypeNavigationBar),
                                      kCRToastNotificationPresentationTypeKey   : @(CRToastPresentationTypeCover),
                                      kCRToastAutorotateKey                     : @(NO),
                                      kCRToastUnderStatusBarKey                 : @(NO),
                                      kCRToastTextColorKey                      : [UIColor whiteColor],
                                      kCRToastBackgroundColorKey                : COLOR_WITH_HEX(0x000000cc),
                                      kCRToastTextKey                           : infoString,
                                      kCRToastFontKey                           : [UIFont systemFontOfSize:15],
                                      kCRToastTextAlignmentKey                  : @(NSTextAlignmentLeft),
                                      kCRToastTimeIntervalKey                   : @(1.5),
                                      kCRToastAnimationInTypeKey                : @(CRToastAnimationTypeLinear),
                                      kCRToastAnimationOutTypeKey               : @(CRToastAnimationTypeLinear),
                                      kCRToastAnimationInDirectionKey           : @(CRToastAnimationDirectionBottom),
                                      kCRToastAnimationOutDirectionKey          : @(CRToastAnimationDirectionBottom)} mutableCopy];
    
    options[kCRToastTextAlignmentKey] = @(NSTextAlignmentCenter);
    [CRToastManager showNotificationWithOptions:options
                                 apperanceBlock:^(void) {
                                     
                                 }
                                completionBlock:^(void) {
                                    
                                }];
}

+ (void)showToastByFadeAnimation:(NSString*)infoString{
    if (!infoString) return;
    [CRToastManager dismissNotification:NO];
    NSMutableDictionary *options = [@{kCRToastNotificationTypeKey               : @(CRToastTypeNavigationBar),
                                      kCRToastNotificationPresentationTypeKey   : @(CRToastPresentationTypeCover),
                                      kCRToastAutorotateKey                     : @(NO),
                                      kCRToastUnderStatusBarKey                 : @(YES),
                                      kCRToastTextColorKey                      : [UIColor whiteColor],
                                      kCRToastBackgroundColorKey                : COLOR_WITH_HEX(0x000000cc),
                                      kCRToastTextKey                           : infoString,
                                      kCRToastFontKey                           : [UIFont systemFontOfSize:15],
                                      kCRToastTextAlignmentKey                  : @(NSTextAlignmentLeft),
                                      kCRToastTimeIntervalKey                   : @(1.5),
                                      kCRToastAnimationInTypeKey                : @(CRToastAnimationTypeLinear),
                                      kCRToastAnimationOutTypeKey               : @(CRToastAnimationTypeLinear),
                                      kCRToastAnimationInDirectionKey           : @(0),
                                      kCRToastAnimationOutDirectionKey          : @(0)} mutableCopy];
    
    options[kCRToastTextAlignmentKey] = @(NSTextAlignmentCenter);
    [CRToastManager showNotificationWithOptions:options
                                 apperanceBlock:^(void) {
                                 }
                                completionBlock:^(void) {
                                }];
}

+ (void)showToast:(WDToastType)toastType
         withText:(NSString *)infoString
  completionBlock:(void (^)(void))completion {
    
    if (!infoString) return;
    [CRToastManager dismissNotification:NO];
    NSMutableDictionary *options = [@{kCRToastNotificationTypeKey               : @(CRToastTypeNavigationBar),
                                      kCRToastNotificationPresentationTypeKey   : @(CRToastPresentationTypeCover),
                                      kCRToastAutorotateKey                     : @(NO),
                                      kCRToastUnderStatusBarKey                 : @(NO),
                                      kCRToastTextColorKey                      : [UIColor whiteColor],
                                      kCRToastBackgroundColorKey                : COLOR_WITH_HEX(0x000000cc),
                                      kCRToastTextKey                           : infoString,
                                      kCRToastFontKey                           : [UIFont systemFontOfSize:15],
                                      kCRToastTextAlignmentKey                  : @(NSTextAlignmentLeft),
                                      kCRToastTimeIntervalKey                   : @(1.5),
                                      kCRToastAnimationInTypeKey                : @(CRToastAnimationTypeLinear),
                                      kCRToastAnimationOutTypeKey               : @(CRToastAnimationTypeLinear),
                                      kCRToastAnimationInDirectionKey           : @(0),
                                      kCRToastAnimationOutDirectionKey          : @(0)} mutableCopy];
    
    options[kCRToastTextAlignmentKey] = @(NSTextAlignmentCenter);
    [CRToastManager showNotificationWithOptions:options
                                 apperanceBlock:^(void) {
                                 }
                                completionBlock:^(void) {
                                    if (completion) {
                                        completion ();
                                    }
                                }];
}

@end
