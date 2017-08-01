//
//  WDSelectSeatViewController.m
//  WDMovie
//
//  Created by WindyZhang on 2017/7/31.
//  Copyright © 2017年 feeyo. All rights reserved.
//

#import "WDSelectSeatViewController.h"
#import "WDSelectSeatCollectionViewCell.h"
#import <Masonry.h>

static NSString *const kSelectSeatCollectionViewCellID = @"kSelectSeatCollectionViewCellID";

@interface WDSelectSeatViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSDictionary *selectSeatDic;
@property (nonatomic, strong) NSMutableArray *seatStatusArray;
@property (nonatomic, copy) NSArray *seatKeyArray;

@property (nonatomic, assign) CGFloat cellWidth;
@property (nonatomic, assign) CGFloat itemSpace;


@end

@implementation WDSelectSeatViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNavigationBarStyle:HistoryStyle];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"座位图";
    self.view.backgroundColor = WD_COLOR.background;
    [self loadSeatData];
    [self.view addSubview:self.collectionView];
    
}

- (void)loadSeatData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"selectSeat" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    _selectSeatDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    
    self.seatKeyArray = _selectSeatDic[@"main"][@"seatkey"];
    @weakify(self);
    self.seatStatusArray = [NSMutableArray arrayWithArray:_selectSeatDic[@"main"][@"seatstate"]];
    [self.seatStatusArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSArray *obj, NSUInteger idx, BOOL *_Nonnull stop) {
        @strongify(self);
        if ([self.seatKeyArray[0] count] - 1 >= idx) {
            if (obj.count == 0) {
                [self.seatStatusArray removeObjectAtIndex:idx];
            } else {
                NSMutableArray *mutArray = [obj mutableCopy];
                [mutArray insertObject:self.seatKeyArray[0][idx] atIndex:0];
                [mutArray addObject:self.seatKeyArray[0][idx]];
                [self.seatStatusArray replaceObjectAtIndex:idx withObject:mutArray];
            }
        } else {
            NSMutableArray *mutArray = [obj mutableCopy];
            [mutArray insertObject:@"=" atIndex:0];
            [self.seatStatusArray replaceObjectAtIndex:idx withObject:mutArray];
        }
        
    }];
    [self reloadCellHeightAndSpacing];
}

- (void)reloadCellHeightAndSpacing
{
    __block NSMutableArray *countArray = [NSMutableArray array];
    [_seatStatusArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSArray *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        [countArray addObject:WDFORMAT(@"%zd", (unsigned long)obj.count)];
    }];
    NSInteger itemCount = [[countArray valueForKeyPath:@"@max.integerValue"] integerValue];
    _cellWidth = (SCREEN_WIDTH - itemCount * 5) / (CGFloat)(itemCount);
    _itemSpace = 5;
    if (_cellWidth >= 26.5) {
        _cellWidth = 26.5;
        _itemSpace = (SCREEN_WIDTH - itemCount * 26.5) / itemCount;
    }
}

- (UICollectionView*)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.footerReferenceSize = CGSizeZero;
        layout.itemSize = CGSizeMake(_cellWidth, _cellWidth);//每个cell的大小
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//        layout.minimumLineSpacing = 2.5;//每行的最小间距
        layout.minimumInteritemSpacing = _itemSpace;//每列的最小间距
        layout.sectionInset = UIEdgeInsetsMake(0, _itemSpace / 2.0, 7.5, _itemSpace / 2.0);//网格视图的/上/左/下/右,的边距
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 200) collectionViewLayout:layout];
        _collectionView.backgroundColor = WD_COLOR.background;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"WDSelectSeatCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:kSelectSeatCollectionViewCellID];
    }
    return _collectionView;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.seatStatusArray.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.seatStatusArray[section] count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(SCREEN_WIDTH, 40);
    }
    return CGSizeZero;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WDSelectSeatCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSelectSeatCollectionViewCellID forIndexPath:indexPath];
    UILabel *label = (UILabel*)[cell.contentView viewWithTag:100];
    UIImageView *imageView = (UIImageView*)[cell.contentView viewWithTag:101];
    label.hidden = YES;
    imageView.hidden = NO;
    NSString *item = self.seatStatusArray[indexPath.section][indexPath.row];
    if ([item isEqualToString:@"*"]) { //空座位
        imageView.image = [UIImage imageNamed:@"free-big"];
    } else if ([@"=QIS " haveString:item]) { //无座位（包括通道）
        imageView.hidden = YES;
        label.hidden = YES;
    } else if ([item isEqualToString:@"U"]) { //被占座位
        imageView.image = [UIImage imageNamed:@"notselect-big"];
    } else if ([item isEqualToString:@"DONE"]) { //自己选择的座位
        imageView.image = [UIImage imageNamed:@"selected-big"];
    } else if ([item isEqualToString:@"E"] || item.length > 1) { //紧急出口
        if (![item isEqualToString:@"E"]) {
            label.textColor = COLOR_WITH_HEX(0x999999ff);
            label.font = [UIFont systemFontOfSize:14];
            label.adjustsFontSizeToFitWidth = YES;
        } else {
            label.font = [UIFont systemFontOfSize:23];
            label.textColor = COLOR_WITH_HEX(0x95cc00ff);
        }
        label.text = item;
        label.hidden = NO;
        imageView.hidden = YES;
    } else if ([item isEqualToString:@"H"]) { //自己预约的座位
        imageView.image = [UIImage imageNamed:@"order-big"];
    } else if ([item isEqualToString:@"W"]) { //无窗座位
        imageView.image = [UIImage imageNamed:@"nowindow_big"];
    } else {
        imageView.image = [UIImage imageNamed:@"notselect-big"]; //不可选
    }
    return cell;
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
