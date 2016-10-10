//
//  WDWebViewController.h
//  WDMovie
//
//  Created by WindyZhang on 16/9/29.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDBaseViewController.h"

@interface WDWebViewController : WDBaseViewController

@property(nonatomic,copy)NSString *webTitle;
@property(nonatomic,copy)NSString *url;

+ (instancetype)webViewControllerWithURL:(NSString *)url withTitle:(NSString *)title;

@end
