//
//  WDMovieDetailViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/9/8.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDMovieDetailViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface WDMovieDetailViewController ()

@end

@implementation WDMovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"电影详情";
    self.view.backgroundColor = WD_COLOR.background;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:@"" parameters:@"" progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
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
