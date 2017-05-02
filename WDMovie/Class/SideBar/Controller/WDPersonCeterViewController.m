//
//  WDPersonCeterViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/9/28.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDPersonCeterViewController.h"
#import "WDChangeRealNameController.h"

static NSString *kPersonCeterTableViewCellID = @"kPersonCeterTableViewCellID";

@interface WDPersonCeterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation WDPersonCeterViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNavigationBarStyle:HistoryStyle];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
    self.view.backgroundColor = WD_COLOR.background;
    [self setupTableView];
}
- (void)setupTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 4;
    } else {
        return 1;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 60;
    } else if (indexPath.section == 1) {
        return 44;
    } else {
        return 50;
    }
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPersonCeterTableViewCellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kPersonCeterTableViewCellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"头像";
        cell.textLabel.textColor = COLOR_WITH_HEX(0x666666ff);

        UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70, 10, 40, 40)];
        iconImageView.layer.cornerRadius = 20;
        iconImageView.layer.masksToBounds = YES;
        iconImageView.image = [UIImage imageNamed:@"userIcon"];
        [cell.contentView addSubview:iconImageView];
    } else if (indexPath.section == 1) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.textColor = COLOR_WITH_HEX(0x666666ff);
        cell.textLabel.font = [UIFont systemFontOfSize:18];
        
        UILabel *showInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 180, 0, 150, 44)];
        showInfoLabel.textColor = COLOR_WITH_HEX(0x333333ff);
        showInfoLabel.textAlignment = NSTextAlignmentRight;
        showInfoLabel.font = [UIFont systemFontOfSize:16];
        [cell.contentView addSubview:showInfoLabel];
        
        if (indexPath.row == 0) {
            cell.textLabel.text = @"修改姓名";
            showInfoLabel.text = @"WindyZhang";
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"昵称";
            showInfoLabel.text = @"至尊宝";

        } else if (indexPath.row == 2) {
            cell.textLabel.text = @"性别";
            showInfoLabel.text = @"男";

        } else {
            cell.textLabel.text = @"生日";
            showInfoLabel.text = @"1993-01-05";

        }
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;

        UILabel *logoutLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, SCREEN_WIDTH - 60, 50)];
        logoutLabel.text = @"退出登录";
        logoutLabel.textColor = COLOR_WITH_HEX(0x333333ff);
        logoutLabel.textAlignment = NSTextAlignmentCenter;
        logoutLabel.font = [UIFont systemFontOfSize:18];
        [cell.contentView addSubview:logoutLabel];

    }

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            WDChangeRealNameController *changeRealNameVC = [[WDChangeRealNameController alloc] init];
            [self.navigationController pushViewController:changeRealNameVC animated:YES];
        }
    } else {
        
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
