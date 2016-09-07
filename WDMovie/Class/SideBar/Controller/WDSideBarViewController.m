//
//  WDSideBarViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/8/9.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDSideBarViewController.h"
#import "WDSettingViewController.h"

@interface WDSideBarViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSArray *titles;
@property(nonatomic,copy)NSArray *images;

@end

@implementation WDSideBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WD_COLOR.background;
    [self initTableView];
    self.titles = @[@"清除缓存",
                    @"给个评价",
                    @"商务合作",
                    @"检测新版本",
                    @"欢迎页",
                    @"关于我们"
                    ];
    
    self.images = @[@"sideBar_Clear",
                    @"sideBar_Score",
                    @"sideBar_Business",
                    @"sideBar_Version",
                    @"sideBar_Welcome",
                    @"sideBar_About",
                    ];
    
}
- (void)initTableView{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titles.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 150;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 40, 50, 50)];
    imageView.image = [UIImage imageNamed:@"userIcon"];
    imageView.layer.cornerRadius = 25;
    imageView.layer.masksToBounds = YES;
    [headerView addSubview:imageView];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 50, 120, 30)];
    nameLabel.text = @"CiOS-张文迪";
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.font = [UIFont systemFontOfSize:20];
    [headerView addSubview:nameLabel];
    
    UILabel *descLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 95, 150, 20)];
    descLabel.text = @"QQ达人";
    descLabel.textColor = [UIColor orangeColor];
    descLabel.textAlignment = NSTextAlignmentLeft;
    descLabel.font = [UIFont systemFontOfSize:18];
    [headerView addSubview:descLabel];
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 80;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 40, 20, 20)];
    imageView.image = [UIImage imageNamed:@"sideBar_Set"];
    [footerView addSubview:imageView];
    
    UILabel *descLabel = [[UILabel alloc]initWithFrame:CGRectMake(55, 40, 100, 20)];
    descLabel.text = @"设置";
    descLabel.textColor = [UIColor blackColor];
    descLabel.textAlignment = NSTextAlignmentLeft;
    descLabel.font = [UIFont systemFontOfSize:18];
    [footerView addSubview:descLabel];
    
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickFooterView:)];
    [footerView addGestureRecognizer:tapGest];
    
    return footerView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"sidebarcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.contentView.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.text = self.titles[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:self.images[indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        
        WDSettingViewController *settingVC = [[WDSettingViewController alloc]init];
        settingVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:settingVC animated:YES];
    }
    
}
- (void)clickFooterView:(UITapGestureRecognizer *)tap{
    WDSettingViewController *settingVC = [[WDSettingViewController alloc]init];
    settingVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settingVC animated:YES];
}
#pragma mark - drawer

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
