//
//  WDAutoScrollerView.m
//  WDMovie
//
//  Created by WindyZhang on 16/9/28.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDAutoScrollerView.h"
#import "NSTimer+block.h"

@interface WDAutoScrollerView()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,assign)BOOL autoScroll;
@property(nonatomic,strong)NSTimer *autoScrollTimer;
@property(nonatomic,copy)NSArray *imageArray;
@property(nonatomic,assign)NSInteger imageCount;
@end

@implementation WDAutoScrollerView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.imageArray = @[@"News4",@"News1",@"News2",@"News3",@"News4",@"News1"];
        self.imageCount = _imageArray.count - 2;
        [self configScrollerAndPageControlFrame];
        [self configScroller];
    }
    return self;
}
- (void)configScrollerAndPageControlFrame{
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CGRectGetHeight(self.frame))];
    self.scrollView.backgroundColor = WD_COLOR.background;
    self.scrollView.delegate = self;
    self.scrollView.contentOffset = CGPointMake(0, 0);
    self.scrollView.contentSize = CGSizeMake(self.imageArray.count*SCREEN_WIDTH,CGRectGetHeight(self.frame));
    self.scrollView.pagingEnabled = YES;//分页模式
    self.scrollView.scrollEnabled = YES;//支持手动滑动
    self.scrollView.bounces = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:self.scrollView];
    
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.frame = CGRectMake(SCREEN_WIDTH/2 - 45, CGRectGetHeight(self.frame) - 30, 90, 20);
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = self.imageCount;
    self.pageControl.enabled = NO;//禁止默认的点击功能
    [self addSubview:self.pageControl];
    [self bringSubviewToFront:self.pageControl];
    self.pageControl.pageIndicatorTintColor = [[UIColor alloc] initWithWhite:255 alpha:0.5];
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
}
-(void)configScroller{
    
    for (int i = 0; i < self.imageArray.count; i++) {
        NSString *imageName = self.imageArray[i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, CGRectGetHeight(self.frame))];
        imageView.image = [UIImage imageNamed:imageName];
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapImage = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSelect:)];
        [imageView addGestureRecognizer:tapImage];
        imageView.tag = 1000 + i;
        [self.scrollView addSubview:imageView];
    }
    self.autoScroll = YES;
    
}
- (void)setAutoScroll:(BOOL)autoScroll{
    _autoScroll = autoScroll;
    if (autoScroll) {
        if (!self.autoScrollTimer || !self.autoScrollTimer.isValid) {//判断定时器是否存在或失效
            @weakify(self);
            self.autoScrollTimer = [NSTimer wd_scheduledTimerWithTimeInterval:5
                                                                    withBlock:^{
                                                                             @strongify(self);
                                                                             [self handleScrollTimer];
                                                                         }
                                                                 withRepeats:YES];
            [[NSRunLoop currentRunLoop] addTimer:self.autoScrollTimer forMode:NSRunLoopCommonModes];
            [self.autoScrollTimer fire];
        }
    }else{
         [self.autoScrollTimer invalidate];//移除定时器
    }
}

- (void)handleScrollTimer{
    if (self.scrollView.contentOffset.x == 0) {
        [self.scrollView setContentOffset:CGPointMake((self.pageControl.currentPage + 1) * SCREEN_WIDTH, 0) animated:YES];
    }else{
        [self.scrollView setContentOffset:CGPointMake((self.pageControl.currentPage + 2) * SCREEN_WIDTH, 0) animated:YES];
    }
}

- (void)handleSelect:(UIGestureRecognizer *)gestureRecognizer{
    
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x == (self.imageCount + 1) * SCREEN_WIDTH){//滑动图片后改变scrollView偏移量
        scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
        self.pageControl.currentPage = 0;
    }else if (scrollView.contentOffset.x == 0){
        scrollView.contentOffset = CGPointMake(self.imageCount * SCREEN_WIDTH, 0);
        self.pageControl.currentPage = self.imageCount;
    }else{
        self.pageControl.currentPage = scrollView.contentOffset.x/SCREEN_WIDTH - 1;
    }
}

- (void)dealloc{
    [self.autoScrollTimer invalidate];//移除定时器
}

@end
