//
//  WDMainTabBarController.h
//  WDMovie
//
//  Created by WindyZhang on 16/8/9.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDMainTabBarController : UITabBarController<ICSDrawerControllerPresenting,ICSDrawerControllerChild>
@property (nonatomic,weak) ICSDrawerController *drawer;
@end
