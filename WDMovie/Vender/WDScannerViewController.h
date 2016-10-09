//
//  WDScannerViewController.h
//  WDMovie
//
//  Created by WindyZhang on 16/10/8.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDBaseViewController.h"

typedef void (^CompletionCallBack)(NSString *);

@interface WDScannerViewController : WDBaseViewController

// 实例化扫描控制器
//
// @param cardName   名片字符串
// @param avatar     头像图片
// @param completion 完成回调
//
// @return 扫描控制器
//- (instancetype)initWithCardName:(NSString *)cardName avatar:(UIImage *)avatar completion:(void (^)(NSString *stringValue))completion;

@end
