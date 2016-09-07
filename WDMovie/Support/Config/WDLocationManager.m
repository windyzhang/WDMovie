//
//  WDLocationManager.m
//  WDMovie
//
//  Created by WindyZhang on 16/9/7.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDLocationManager.h"
#import <MapKit/MapKit.h>

@interface WDLocationManager()<CLLocationManagerDelegate>

@property (nonatomic, strong)CLLocationManager *locationManager;

@end

@implementation WDLocationManager

WDSingleton(WDLocationManager);

- (id)init{
    self = [super init];
    if (self) {
        [self updatingLocation];
    }
    return self;
}
- (void)updatingLocation{
    if (![CLLocationManager locationServicesEnabled]) {
        return;
    }
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;//设置定位精度
    [self.locationManager startUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *location = locations.lastObject;
    [USER_DEFAULTS setObject:WDFORMAT(@"%f",location.coordinate.latitude) forKey:kLatitude];
    [USER_DEFAULTS setObject:WDFORMAT(@"%f",location.coordinate.longitude) forKey:kLongitude];
    self.locationManager = nil;
    [self.locationManager stopUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"%@",error.localizedDescription);
}
@end
