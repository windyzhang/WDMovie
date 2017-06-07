//
//  WDNewsViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/8/9.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDNewsViewController.h"
#import "WDAutoScrollerView.h"
#import "WDNewsTableViewCell.h"
#import "WDNewsModel.h"
#import <UIImageView+WebCache.h>

static NSString *const kNewsTableViewCellID = @"kNewsTableViewCellID";
static NSString *const kNewsTableViewHeaderViewID = @"kNewsTableViewHeaderViewID";

@interface WDNewsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *modelArray;

@end

@implementation WDNewsViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNavigationBarStyle:HistoryStyle];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新闻";
    self.view.backgroundColor = WD_COLOR.background;
    [self loadLocalData];
    [self initTableView];
}

- (void)initTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    [self.tableView registerClass:[WDNewsTableViewCell class] forCellReuseIdentifier:kNewsTableViewCellID];
    [self.tableView registerNib:[UINib nibWithNibName:@"WDNewsTableViewCell" bundle:nil] forCellReuseIdentifier:kNewsTableViewCellID];
    [self.view addSubview:self.tableView];
    
}
- (void)loadLocalData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"news_list" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    _modelArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        WDNewsModel *model = [[WDNewsModel alloc] init];
        model.sid = dic[@"id"];
        model.imageUrl = dic[@"image"];
        model.type = dic[@"type"];
        model.title = dic[@"title"];
        model.subTitle = dic[@"summary"];
        [_modelArray addObject:model];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _modelArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 200;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kNewsTableViewHeaderViewID];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    NSArray *images = @[@"News1",@"News2",@"News3",@"News4"];
    WDAutoScrollerView *autoView = [[WDAutoScrollerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200) images:images autoPlay:YES delay:5];
    [headerView addSubview:autoView];
    return headerView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WDNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kNewsTableViewCellID];
    if (cell == nil) {
        cell = [[WDNewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kNewsTableViewCellID];
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    WDNewsModel *model = _modelArray[indexPath.row];
    [cell.homeImageView sd_setImageWithURL:[NSURL URLWithString:model.imageUrl]];
    cell.homeTitleLabel.text = model.title;
    cell.subTitleLabel.text = model.subTitle;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
