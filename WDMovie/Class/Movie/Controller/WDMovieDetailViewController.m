//
//  WDMovieDetailViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/9/8.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDMovieDetailViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface WDMovieDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property(nonatomic,strong)UIView *topView;
@property(nonatomic,strong)UISegmentedControl *segmentedContol;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,assign)CGFloat threshold;// 监测范围的临界点,>0代表向上滑动多少距离,<0则是向下滑动多少距离
@property(nonatomic,assign)CGFloat marginTop;// 记录scrollView.contentInset.top

@end

@implementation WDMovieDetailViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNavigationBarStyle:HistoryStyle];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"电影详情";
    self.view.backgroundColor = WD_COLOR.background;
    [self initTopView];
    [self initTableView];
}

- (void)initTopView{
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    self.topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topView];
    
    self.segmentedContol = [[UISegmentedControl alloc] initWithItems:@[@"国内电影",@"国际电影"]];
    self.segmentedContol.frame = CGRectMake(SCREEN_WIDTH/2 - 100, 15, 200, 30);
    self.segmentedContol.selectedSegmentIndex = 0;
    self.segmentedContol.tintColor = WD_COLOR.button;
    [self.topView addSubview:self.segmentedContol];
}

- (void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, SCREEN_HEIGHT - 124) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentifier = @"cell__007";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    // 实时监测scrollView.contentInset.top， 系统优化以及手动设置contentInset都会影响contentInset.top。
//    if (self.marginTop != self.tableView.contentInset.top) {
//        self.marginTop = self.tableView.contentInset.top;
//    }
//    CGFloat offsetY = scrollView.contentOffset.y;
    
    // newoffsetY 便是我们想监测的偏移offset.y，初始值为0
    // 向下滑动时<0，向上滑动时>0；
//    CGFloat newoffsetY = self.marginTop + offsetY - 60;
//    self.topView.frame = CGRectMake(0, -newoffsetY, SCREEN_WIDTH, 60);
//    self.tableView.frame = CGRectMake(0, -self.marginTop, SCREEN_WIDTH, SCREEN_HEIGHT - 124);
//    if (newoffsetY >= self.threshold && newoffsetY <= 0) {
//        CGFloat progress = newoffsetY/self.threshold;
//    }
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
