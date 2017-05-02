//
//  NSString+Operation.h
//  WDMovie
//
//  Created by WindyZhang on 2016/12/22.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Operation)

- (void)alertInViewController:(UIViewController *)viewController;
- (BOOL)isEmptyOrNil;
- (BOOL)isChinese;
- (BOOL)includeChinese;

@end
