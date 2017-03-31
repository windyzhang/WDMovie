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
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIView *topView;
@property(nonatomic,strong)UISegmentedControl *segmentedContol;
@property(nonatomic,strong)UITableView *tableView;

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
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    self.scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.scrollView];
    [self initTableView];
    [self initTopView];
}

- (void)initTopView{
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    self.topView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.topView];
    
    self.segmentedContol = [[UISegmentedControl alloc] initWithItems:@[@"国内电影",@"国际电影"]];
    self.segmentedContol.frame = CGRectMake(SCREEN_WIDTH/2 - 100, 15, 200, 30);
    self.segmentedContol.selectedSegmentIndex = 0;
    self.segmentedContol.tintColor = WD_COLOR.button;
    [self.topView addSubview:self.segmentedContol];
}

- (void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.contentInset = UIEdgeInsetsMake(60, 0, 0, 0);
    [self.scrollView addSubview:self.tableView];
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
    if (scrollView.contentOffset.y + 60 <= 0) {
        self.topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 60);
    }else{
        self.topView.frame = CGRectMake(0, -(scrollView.contentOffset.y + 60), SCREEN_WIDTH, 60);
    }
   
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
