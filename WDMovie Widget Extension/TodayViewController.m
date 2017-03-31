//
//  TodayViewController.m
//  WDMovie Widget Extension
//
//  Created by WindyZhang on 2017/3/9.
//  Copyright © 2017年 feeyo. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *checkinButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 40, 15, 80, 30)];
    [checkinButton setTitle:@"手机选座" forState:UIControlStateNormal];
    [checkinButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:checkinButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
