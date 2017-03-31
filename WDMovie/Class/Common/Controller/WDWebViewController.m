//
//  WDWebViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/9/29.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDWebViewController.h"
#import <WebKit/WebKit.h>

@interface WDWebViewController ()<WKNavigationDelegate>

@property(nonatomic,strong)WKWebView *webView;

@end

@implementation WDWebViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNavigationBarStyle:HistoryStyle];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.webTitle;
    self.view.backgroundColor = WD_COLOR.background;
    
    self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.webView.navigationDelegate = self;
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.url]];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
}
+ (instancetype)webViewControllerWithURL:(NSString *)url withTitle:(NSString *)title {
    WDWebViewController *webViewController = [[WDWebViewController alloc] init];
    webViewController.url = url;
    webViewController.webTitle = title;
    return webViewController;
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
}
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"%@",error);
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
