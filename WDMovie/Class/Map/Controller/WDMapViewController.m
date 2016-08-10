//
//  WDMapViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/8/9.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDMapViewController.h"

@interface WDMapViewController ()

@end

@implementation WDMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    WDLeftNavigationItemButton *leftButton = [[WDLeftNavigationItemButton alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
}
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
