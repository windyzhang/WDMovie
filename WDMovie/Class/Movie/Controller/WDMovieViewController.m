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

@interface WDMovieViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *imageArray;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation WDMovieViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNavigationBarStyle:HistoryStyle];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"电影";
    self.view.backgroundColor = WD_COLOR.background;
    [self initCollectionView];
    self.imageArray = [NSMutableArray array];
    for (int i = 0; i < 28; i++) {
        [self.imageArray addObject:[NSString stringWithFormat:@"Movie%d",i+1]];
    }
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
- (void)initCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.headerReferenceSize = CGSizeZero;//头部视图的框架大小
    layout.footerReferenceSize = CGSizeZero;
    layout.itemSize = CGSizeMake((SCREEN_WIDTH - 20)/3, (SCREEN_WIDTH - 20)/3 + 30);//每个cell的大小
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 5;//每行的最小间距
    layout.minimumInteritemSpacing = 5;//每列的最小间距
    layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);//网格视图的/上/左/下/右,的边距
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"MovieCollectionCell"];
    [self.view addSubview:self.collectionView];
}

#pragma mark - collectionView delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imageArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MovieCollectionCell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor clearColor];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH - 20)/3, (SCREEN_WIDTH - 20)/3 + 30)];
    imageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    imageView.layer.cornerRadius = 10;
    imageView.layer.masksToBounds = YES;
    [cell.contentView addSubview:imageView];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    WDMovieDetailViewController *movieDetailVC = [[WDMovieDetailViewController alloc]init];
    movieDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:movieDetailVC animated:YES];
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
