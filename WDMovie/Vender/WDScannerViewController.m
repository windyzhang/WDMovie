//
//  WDScannerViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/10/8.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDScannerViewController.h"
#import "WDScannerBorder.h"
#import "WDScanner.h"
#import "WDScannerMaskView.h"
#import "WDWebViewController.h"

/// 控件间距
#define kControlMargin  32.0

@interface WDScannerViewController ()

@property (nonatomic, copy) NSString *cardName;// 名片字符串
@property (nonatomic, strong) UIImage *avatar;// 头像图片

@end

@implementation WDScannerViewController{
    WDScannerBorder *scannerBorder;// 扫描框
    WDScanner *scanner;// 扫描器
    UILabel *tipLabel;// 提示标签
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"扫一扫";
    self.view.backgroundColor = WD_COLOR.background;
    [self prepareScanerBorder];
    [self prepareOtherControls];
    
    // 实例化扫描器
    scanner = [[WDScanner alloc] initWithView:self.view scanFrame:scannerBorder.frame];
    @weakify(self);
    scanner.completionBlock = ^(NSString *string){
        @strongify(self);
        WDWebViewController *webViewC = [WDWebViewController webViewControllerWithURL:string withTitle:@""];
        [self.navigationController pushViewController:webViewC animated:YES];
    };
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNavigationBarStyle:ClearStyle];
    [scannerBorder startScannerAnimating];
    [scanner startScan];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [scannerBorder stopScannerAnimating];
    [scanner stopScan];
}

// 准备提示标签和名片按钮
- (void)prepareOtherControls {
    
    // 1> 提示标签
    tipLabel = [[UILabel alloc] init];
    tipLabel.text = @"将二维码/条码放入框中，即可自动扫描";
    tipLabel.font = [UIFont systemFontOfSize:12];
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    [tipLabel sizeToFit];
    tipLabel.center = CGPointMake(scannerBorder.center.x, CGRectGetMaxY(scannerBorder.frame) + kControlMargin);
    [self.view addSubview:tipLabel];
    
    // 2> 名片按钮
    UIButton *cardButton = [[UIButton alloc] init];
    [cardButton setTitle:@"我的名片" forState:UIControlStateNormal];
    cardButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [cardButton setTitleColor:self.navigationController.navigationBar.tintColor forState:UIControlStateNormal];
    [cardButton sizeToFit];
    cardButton.center = CGPointMake(tipLabel.center.x, CGRectGetMaxY(tipLabel.frame) + kControlMargin);
    [self.view addSubview:cardButton];
    
    //[cardButton addTarget:self action:@selector(clickCardButton) forControlEvents:UIControlEventTouchUpInside];
}

// 准备扫描框
- (void)prepareScanerBorder {
    
    CGFloat width = self.view.bounds.size.width - 80;
    scannerBorder = [[WDScannerBorder alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    scannerBorder.center = self.view.center;
    scannerBorder.tintColor = self.navigationController.navigationBar.tintColor;
    [self.view addSubview:scannerBorder];
    
    WDScannerMaskView *maskView = [WDScannerMaskView maskViewWithFrame:self.view.bounds cropRect:scannerBorder.frame];
    [self.view insertSubview:maskView atIndex:0];
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
