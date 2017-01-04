//
//  WDHomeBaseViewController.m
//  WDMovie
//
//  Created by WindyZhang on 2017/1/4.
//  Copyright © 2017年 feeyo. All rights reserved.
//

#import "WDHomeBaseViewController.h"
#import "UIViewController+MMDrawerController.h"

@interface WDHomeBaseViewController ()

@end

@implementation WDHomeBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *leftBarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBarBtn.frame = CGRectMake(0, 0, 30, 30);
    leftBarBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    leftBarBtn.layer.borderWidth = 1.5;
    leftBarBtn.layer.cornerRadius = 15;
    leftBarBtn.layer.masksToBounds = YES;
    [leftBarBtn setImage:[UIImage imageNamed:@"userIcon"] forState:UIControlStateNormal];
    [leftBarBtn addTarget:self action:@selector(showSideBarClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarBtn];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    [self.mm_drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeNone];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeBezelPanningCenterView];
    [self.mm_drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
}

- (void)showSideBarClick {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
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
