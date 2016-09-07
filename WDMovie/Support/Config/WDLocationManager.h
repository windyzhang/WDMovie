//
//  WDLocationManager.h
//  WDMovie
//
//  Created by WindyZhang on 16/9/7.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import <Foundation/Foundation.h>

#define WD_LOCATION_MANAGER [WDLocationManager sharedWDLocationManager]

@interface WDLocationManager : NSObject

+ (WDLocationManager *)sharedWDLocationManager;


@end
