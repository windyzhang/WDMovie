//
//  WDMapViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/8/9.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDMapViewController.h"
#import <MapKit/MapKit.h>

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

@interface WDMapViewController ()<MKMapViewDelegate>

@property(nonatomic,strong)MKMapView *mapview;
@property(nonatomic,assign)CLLocationCoordinate2D coordinate;
@end

@implementation WDMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"地图";
    self.view.backgroundColor = WD_COLOR.background;
    [self initMapView];
    [self initSubViews];
}
- (void)initSubViews{
    UIButton *changeButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 30, 40, 40)];
    [changeButton setImage:[UIImage imageNamed:@"map_changeType"] forState:UIControlStateNormal];
    __block BOOL isSelect = NO;
    @weakify(self);
    [changeButton setBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
        @strongify(self);
        if (isSelect) {
            self.mapview.mapType = MKMapTypeStandard;
            isSelect = NO;
        }else{
            isSelect = YES;
            self.mapview.mapType = MKMapTypeSatellite;
        }
    }];
    [self.view addSubview:changeButton];
}
- (void)initMapView{
    self.mapview = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    self.mapview.delegate = self;
    self.mapview.mapType = MKMapTypeStandard;
    self.mapview.showsUserLocation = YES;
    [self.view addSubview:self.mapview];
    
    CLLocationDegrees latitude = [[USER_DEFAULTS objectForKey:kLatitude] floatValue];
    CLLocationDegrees longitude = [[USER_DEFAULTS objectForKey:kLongitude] floatValue];
    self.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    //显示的跨度
    MKCoordinateSpan span = {0.05, 0.05};
    MKCoordinateRegion region = MKCoordinateRegionMake(self.coordinate, span);
    //2.设置地图显示的区域
    [self.mapview setRegion:region animated:YES];

    //[self addAnnotation];
    
}
- (void)addAnnotation{
    //CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(_latitude,_longitude);
    WDAnnotation *annotation = [[WDAnnotation alloc]initWithCoordinate:_coordinate];
    //    annotation.title = @"新华国际广场";
    //    annotation.subtitle = @"A座";
    //    annotation.coordinate = coordinate;
    // annotation.image = [UIImage imageNamed:@"location_icon"];
    [self.mapview addAnnotation:annotation];
    //[self.mapview setCenterCoordinate:coordinate animated:NO];
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
