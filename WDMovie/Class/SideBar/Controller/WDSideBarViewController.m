//
//  WDSideBarViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/8/9.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDSideBarViewController.h"

@interface WDSideBarViewController ()

@end

@implementation WDSideBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
}
- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidOpen:(ICSDrawerController *)drawerController{
    self.view.userInteractionEnabled = YES;
}

- (void)drawerControllerWillClose:(ICSDrawerController *)drawerController{
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
