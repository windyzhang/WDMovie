//
//  WDSideBarViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/8/9.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDSideBarViewController.h"
#import "WDSettingViewController.h"
#import "WDPersonCeterViewController.h"
#import "WDBarCodeViewController.h"
#import "WDWebViewController.h"
#import "AppDelegate.h"
#import "UIViewController+MMDrawerController.h"

@interface WDSideBarViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSArray *titles;
@property(nonatomic,copy)NSArray *images;

@end

@implementation WDSideBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WD_COLOR.background;
    UIImageView *background = [[UIImageView alloc]initWithFrame:self.view.bounds];
    background.image = [UIImage imageNamed:@"sideBar_Background"];
    [self.view addSubview:background];
    [self initTableView];
    [self initTopView];
    [self initBottomView];
    self.titles = @[@"清除缓存",
                    @"给个评价",
                    @"商务合作",
                    @"检测新版本",
                    @"欢迎页",
                    @"关于我们"];
    
    self.images = @[@"sideBar_Clear",
                    @"sideBar_Score",
                    @"sideBar_Business",
                    @"sideBar_Version",
                    @"sideBar_Welcome",
                    @"sideBar_About"];
    
}
- (void)initTopView{
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    topView.backgroundColor = [UIColor clearColor];
    UITapGestureRecognizer *topViewTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTopView:)];
    [topView addGestureRecognizer:topViewTap];
    [self.view addSubview:topView];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 40, 55, 55)];
    imageView.image = [UIImage imageNamed:@"userIcon"];
    imageView.layer.cornerRadius = 25;
    imageView.layer.masksToBounds = YES;
    [topView addSubview:imageView];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(75, 40, 120, 30)];
    nameLabel.text = @"WindyZhang";
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.font = [UIFont systemFontOfSize:20];
    [topView addSubview:nameLabel];
    
    UILabel *descLabel = [[UILabel alloc]initWithFrame:CGRectMake(75, 75, 150, 20)];
    descLabel.text = @"QQ达人";
    descLabel.textColor = [UIColor orangeColor];
    descLabel.textAlignment = NSTextAlignmentLeft;
    descLabel.font = [UIFont systemFontOfSize:18];
    [topView addSubview:descLabel];
}
- (void)initBottomView{
    UIButton *settingButton = [[UIButton alloc]initWithFrame:CGRectMake(15, SCREEN_HEIGHT - 60, 80, 35)];
    settingButton.backgroundColor = [UIColor clearColor];
    [settingButton setTitle:@"设置" forState:UIControlStateNormal];
    [settingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [settingButton setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 50)];
    [settingButton setTitleEdgeInsets:UIEdgeInsetsMake(10, 15, 10, 0)];
    settingButton.tintColor = [UIColor whiteColor];
    UIImage *newImage = [[UIImage imageNamed:@"sideBar_Set"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [settingButton setImage:newImage forState:UIControlStateNormal];
    [settingButton setBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
        WDBarCodeViewController *settingVC = [[WDBarCodeViewController alloc]init];
        [self pushViewControllerInMainViewController:settingVC];
    }];
    [self.view addSubview:settingButton];
}
- (void)initTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 150, SCREEN_WIDTH, SCREEN_HEIGHT - 250) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"sidebarcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = self.titles[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:self.images[indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        WDWebViewController *webViewC = [WDWebViewController webViewControllerWithURL:@"https://www.baidu.com" withTitle:@"百度一下"];
        [self pushViewControllerInMainViewController:webViewC];
    }
    
}
- (void)tapTopView:(UITapGestureRecognizer *)tap{
    WDPersonCeterViewController *personCeterVC = [[WDPersonCeterViewController alloc]init];
    [self pushViewControllerInMainViewController:personCeterVC];
}
- (void)pushViewControllerInMainViewController:(UIViewController *)viewController{
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    UINavigationController *navigationC = appDelegate.mainTabBarC.selectedViewController;
    viewController.hidesBottomBarWhenPushed = YES;
    [navigationC pushViewController:viewController animated:NO];
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        [appDelegate.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
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
