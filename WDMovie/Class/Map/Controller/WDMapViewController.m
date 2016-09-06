//
//  WDMapViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/8/9.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDMapViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface WDAnnotation : NSObject <MKAnnotation>

@property(nonatomic, assign) CLLocationCoordinate2D coordinate;

@end

@implementation WDAnnotation

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate {
    self = [super init];
    if (self) {
        self.coordinate  = coordinate;
    }
    return self;
}
@end

@interface WDMapViewController ()<CLLocationManagerDelegate,MKMapViewDelegate>

@property(nonatomic,strong)MKMapView *mapview;
@property(nonatomic,strong)CLLocationManager *locationManager;
//@property(nonatomic,assign)CLLocationDegrees latitude;
//@property(nonatomic,assign)CLLocationDegrees longitude;
@property(nonatomic,assign)CLLocationCoordinate2D coordinate;
@end

@implementation WDMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WD_COLOR.background;
    [self initNavigationItem];
    [self initMapView];
}
- (void)initNavigationItem{
    WDLeftNavigationItemButton *leftButton = [[WDLeftNavigationItemButton alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
}
- (void)initMapView{
    self.mapview = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    self.mapview.delegate = self;
    self.mapview.mapType = MKMapTypeStandard;
    [self.view addSubview:self.mapview];
    
    if (![CLLocationManager locationServicesEnabled]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示"
                                                                                 message:@"您的设备暂未开启定位服务!"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定"
                                                            style:UIAlertActionStyleDefault
                                                          handler:nil]];
        [self presentViewController:alertController
                           animated:YES
                         completion:nil];
        return;
    }
    self.locationManager = [[CLLocationManager alloc]init];
    [self.locationManager requestWhenInUseAuthorization];
    
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;//设置定位精度
    self.locationManager.distanceFilter = 10.0;
    [self.locationManager startUpdatingLocation];
    //用户位置追踪(用户位置追踪用于标记用户当前位置，此时会调用定位服务)
    // _mapview.userTrackingMode=MKUserTrackingModeFollow;
    //[self addAnnotation];
    MKCoordinateSpan span = MKCoordinateSpanMake(_coordinate.latitude, _coordinate.longitude);
    MKCoordinateRegion region = MKCoordinateRegionMake(_coordinate, span);
    [self.mapview setRegion:region];

}
- (void)addAnnotation{
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(31.837971,117.226533);
    WDAnnotation *annotation = [[WDAnnotation alloc]initWithCoordinate:coordinate];
    //    annotation.title = @"新华国际广场";
    //    annotation.subtitle = @"A座";
    //    annotation.coordinate = coordinate;
    // annotation.image = [UIImage imageNamed:@"location_icon"];
    [self.mapview addAnnotation:annotation];
    //[self.mapview setCenterCoordinate:coordinate animated:NO];
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"%@",error.localizedDescription);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *location = locations.firstObject;
    self.coordinate = location.coordinate;
    
    [self.locationManager stopUpdatingLocation];
}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    //    //由于当前位置的标注也是一个大头针，所以此时需要判断，此代理方法返回nil使用默认大头针视图
    //    if ([annotation isKindOfClass:[WDAnnotation class]]) {
    //        static NSString *identifier=@"AnnotationIdentifier";
    //        MKAnnotationView *annotationView=[_mapview dequeueReusableAnnotationViewWithIdentifier:identifier];
    //        //如果缓存池中不存在则新建
    //        if (!annotationView) {
    //            annotationView=[[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifier];
    //            annotationView.canShowCallout=true;//允许交互点击
    //            annotationView.calloutOffset=CGPointMake(0, 1);//定义详情视图偏移量
    //            annotationView.leftCalloutAccessoryView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"location_icon"]];//定义详情左侧视图
    //        }
    //        //重新设置此类大头针视图的大头针模型(因为有可能是从缓存池中取出来的，位置是放到缓存池时的位置)
    //        annotationView.annotation=annotation;
    //        annotationView.image=((WDAnnotation *)annotation).image;//设置大头针视图的图片
    //        return annotationView;
    //    }else {
    //        return nil;
    //    }
    
    // MKPinAnnotationView：MKAnnotationView子类，可设置大头针颜色pinTintColor（iOS9）
    
    // 由于当前位置的标注也是一个大头针，所以此时需要判断，此代理方法返回nil使用默认大头针视图
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    static NSString * kMKPinAnnotationViewIdentifier = @"identifier";
    // 大头针重用
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:kMKPinAnnotationViewIdentifier];
    if (!annotationView) {
        // 如果缓存池中不存在则新建
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:kMKPinAnnotationViewIdentifier];
    }
    // 修改大头针视图
    // 重新设置此类大头针视图的大头针模型(因为有可能是从缓存池中取出来的，位置是放到缓存池时的位置)
    annotationView.annotation = annotation;
    // 设置大头针图片
    annotationView.image = [UIImage imageNamed:@"location_icon"];
    // 设置大头针凋零效果
    annotationView.animatesDrop = YES;
    // 允许用户交互点击(弹框显示标注详情)
    annotationView.canShowCallout = YES;
    // 定义详情视图偏移量
    annotationView.calloutOffset = CGPointMake(0, 1);
    // 设置大头针颜色
    annotationView.pinTintColor = [UIColor blueColor];
    
    // 自定义大头针详情右侧视图
    // 注意：iOS9以后，可通过detailCalloutAccessoryView来自定义任何标注视图
    UIButton *navigationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    navigationBtn.bounds = CGRectMake(0, 0, 100, 60);
    navigationBtn.backgroundColor = [UIColor grayColor];
    [navigationBtn setTitle:@"导航" forState:UIControlStateNormal];
    annotationView.rightCalloutAccessoryView = navigationBtn;
    
    return annotationView;
}
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
}

#pragma mark - drawer

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController{
    self.view.userInteractionEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
