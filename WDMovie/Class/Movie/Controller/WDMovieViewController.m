//
//  WDMovieViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/8/9.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDMovieViewController.h"
#import "WDMovieDetailViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <SVPullToRefresh.h>

@interface WDMovieViewController ()<UITableViewDelegate,UITableViewDataSource>
//@property(nonatomic,strong)UICollectionView *collectionView;
//@property(nonatomic,strong)NSMutableArray *imageArray;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation WDMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"电影";
    self.view.backgroundColor = WD_COLOR.background;
    [self initLeftNavigationItem];
    [self initTableView];
//    self.imageArray = [NSMutableArray array];
//    for (int i = 0; i < 28; i++) {
//        [self.imageArray addObject:[NSString stringWithFormat:@"Movie%d",i+1]];
//    }
}
- (void)loadData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *urlString = @"http://mobile.api.hunantv.com/channel/getDetail?appVersion=4.7.4&channelId=1001&device=iPhone&mac=d4f9f4bbe7fd9f022153e72ff16a2168da86b9db&osType=ios&osVersion=10.000000&seqId=71a05e0980a44b361c1587a264ab6f24&ticket=4699POMVHERTRGPKF2C7&type=normal";
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"image/jpeg", @"image/png", nil];
    [manager GET:urlString
      parameters:nil
        progress:NULL
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             [self.tableView.pullToRefreshView stopAnimating];
             NSLog(@"%@",responseObject);
    }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             [self.tableView.pullToRefreshView stopAnimating];
             NSLog(@"%@",error);
    }];
}
- (void)initLeftNavigationItem{
    WDLeftNavigationItemButton *leftButton = [[WDLeftNavigationItemButton alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
}
- (void)initTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
//    @weakify(self);
//    [self.tableView addPullToRefreshWithActionHandler:^{
//        @strongify(self);
//        [self loadData];
//    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell_01";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
#pragma mark - drawer

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController{
    self.view.userInteractionEnabled = YES;
}
//- (void)initCollectionView{
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//    //layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 20);//头部视图的框架大小
//    layout.itemSize = CGSizeMake((SCREEN_WIDTH - 40)/3, (SCREEN_WIDTH - 40)/3 +30);//每个cell的大小
//    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    //    layout.minimumLineSpacing = 10;//每行的最小间距
//    //    layout.minimumInteritemSpacing = 10;//每列的最小间距
//    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);//网格视图的/上/左/下/右,的边距
//    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 49) collectionViewLayout:layout];
//    self.collectionView.backgroundColor = [UIColor clearColor];
//    self.collectionView.delegate = self;
//    self.collectionView.dataSource = self;
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"MovieCollectionCell"];
//    [self.view addSubview:self.collectionView];
//}

//#pragma mark - collectionView delegate
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 1;
//}
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return self.imageArray.count;
//}
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MovieCollectionCell" forIndexPath:indexPath];
//    cell.contentView.backgroundColor = [UIColor redColor];
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,(SCREEN_WIDTH - 40)/3, (SCREEN_WIDTH - 40)/3 +30)];
//    imageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
//    [cell.contentView addSubview:imageView];
//    return cell;
//}
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    WDMovieDetailViewController *movieDetailVC = [[WDMovieDetailViewController alloc]init];
//    movieDetailVC.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:movieDetailVC animated:YES];
//}
//- (UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}
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
