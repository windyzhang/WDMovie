//
//  WDBarCodeViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/10/8.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDBarCodeViewController.h"
#import "WDCreateBarcodeOperation.h"

@interface WDBarCodeViewController ()
@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation WDBarCodeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNavigationBarStyle:HistoryStyle];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WD_COLOR.background;
    self.title = @"二维码";
    
    NSString *dataString = @"[Application] Failed to instantiate the default view controller for UIMainStoryboardFile 'Main' - perhaps the designated entry point is not set?";
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 100, (SCREEN_HEIGHT - 64)/2 - 150, 200, 200)];
    [WD_CREATEBARCODE_OPERATION createBarcodeImageWithString:dataString withBarcodeImageView:self.imageView withBarcodeSize:200];
    [self.view addSubview:self.imageView];
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
