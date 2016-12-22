//
//  WDPersonCeterViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/9/28.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDPersonCeterViewController.h"

@interface WDPersonCeterViewController ()

@end

@implementation WDPersonCeterViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNavigationBarStyle:HistoryStyle];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
    self.view.backgroundColor = WD_COLOR.background;
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
