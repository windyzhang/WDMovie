//
//  WDMovieViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/8/9.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDMovieViewController.h"

@interface WDMovieViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *imageArray;
@end

@implementation WDMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WD_COLOR.background;
    [self initLeftNavigationItem];
    [self initCollectionView];
    self.imageArray = [NSMutableArray array];
    for (int i = 0; i < 28; i++) {
        [self.imageArray addObject:[NSString stringWithFormat:@"Movie%d",i+1]];
    }
}
- (void)initLeftNavigationItem{
    WDLeftNavigationItemButton *leftButton = [[WDLeftNavigationItemButton alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
}
- (void)initCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 20);//头部视图的框架大小
    layout.itemSize = CGSizeMake((SCREEN_WIDTH - 40)/3, (SCREEN_WIDTH - 40)/3 +30);//每个cell的大小
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //    layout.minimumLineSpacing = 10;//每行的最小间距
    //    layout.minimumInteritemSpacing = 10;//每列的最小间距
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);//网格视图的/上/左/下/右,的边距
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) collectionViewLayout:layout];
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
    cell.contentView.backgroundColor = [UIColor redColor];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,(SCREEN_WIDTH - 40)/3, (SCREEN_WIDTH - 40)/3 +30)];
    imageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    [cell.contentView addSubview:imageView];
    return cell;
}
#pragma mark - drawer

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController{
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
