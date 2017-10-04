//
//  WDMoreViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/8/9.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDMoreViewController.h"
#import "WDScannerViewController.h"
#import "WDSelectSeatViewController.h"

static NSInteger const headerHeight = 160;
static NSString *kMoreTableViewCellID = @"kMoreTableViewCellID";

@interface WDMoreViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIImageView *backgroundView;
@property(nonatomic,strong)UIView *navigationView;
@property(nonatomic,assign)CGRect originalFrame;

@end

@implementation WDMoreViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNavigationBarStyle:ClearStyle];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更多";
    self.view.backgroundColor = WD_COLOR.background;
    
    _backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, headerHeight + 64)];
    _backgroundView.backgroundColor = [UIColor clearColor];
    _backgroundView.image = [UIImage imageNamed:@"header_view"];
    [self.view addSubview:_backgroundView];
    _originalFrame = _backgroundView.frame;
    
    [self initTableView];
    
    _navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    _navigationView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_navigationView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Scan_icon"]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(scanBarcode)];
}

- (void)initTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 113) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, headerHeight)];
    headerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = headerView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yoffset = scrollView.contentOffset.y;
    if (yoffset < headerHeight) {
        CGFloat colorAlpha = yoffset/headerHeight;
        self.navigationView.backgroundColor = [WD_COLOR.navBarItem colorWithAlphaComponent:colorAlpha];
    } else {
        self.navigationView.backgroundColor = WD_COLOR.navBarItem;
    }
    if (yoffset > 0) {
        //复合语句
        self.backgroundView.frame = ({
            CGRect frame = self.originalFrame;
            frame.origin.y = self.originalFrame.origin.y - yoffset;
            frame;
        });
    } else {
        self.backgroundView.frame = ({
            CGRect frame = self.originalFrame;
            frame.size.height = self.originalFrame.size.height - yoffset;
            frame.size.width = (self.originalFrame.size.height * SCREEN_WIDTH)/(headerHeight + 64);
            frame.origin.x = self.originalFrame.origin.x - (frame.size.width - self.originalFrame.size.width)/2;
            frame;
        });
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 3;
    }else{
        return 2;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMoreTableViewCellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kMoreTableViewCellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = WDFORMAT(@"标题%ld",indexPath.row + 1);
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        WDSelectSeatViewController *selectSeatVC = [[WDSelectSeatViewController alloc] init];
        selectSeatVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:selectSeatVC animated:YES];
    }
}
- (void)scanBarcode{
    WDScannerViewController *scannerVC = [[WDScannerViewController alloc]init];
    scannerVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:scannerVC animated:YES];
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
