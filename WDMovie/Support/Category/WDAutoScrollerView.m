//
//  WDAutoScrollerView.m
//  WDMovie
//
//  Created by WindyZhang on 16/9/28.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDAutoScrollerView.h"
#import "NSTimer+block.h"
#import "WDWebViewController.h"

@interface WDAutoScrollerView()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, assign) int currentPage;
@property (nonatomic, assign) BOOL autoPlay;
@property (nonatomic, assign) NSTimeInterval timeInterval;
@property (nonatomic, strong) NSMutableArray *currentImages;
@property (nonatomic, strong) NSTimer *autoScrollTimer;
@property (nonatomic, copy) NSArray *imageArray;

@end

@implementation WDAutoScrollerView

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray*)images autoPlay:(BOOL)isAuto delay:(NSTimeInterval)timeInterval{
    if (self = [super initWithFrame:frame]) {
        _imageArray = images;
        _autoPlay = isAuto;
        _timeInterval = timeInterval;
        _currentPage = 0;
        [self addScrollView];
        [self addPageControl];
    }
    return self;
}
- (void)addPageControl {

    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 20, SCREEN_WIDTH, 20)];
    backView.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.2];
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    _pageControl.numberOfPages = _imageArray.count;
    _pageControl.currentPage = 0;
    _pageControl.userInteractionEnabled = NO;
    [backView addSubview:_pageControl];
    [self addSubview:backView];
}
- (void)addScrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    for (int i = 0; i < self.currentImages.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, self.frame.size.height)];
        imageView.userInteractionEnabled = YES;
        imageView.image = [UIImage imageNamed:self.currentImages[i]];
        [_scrollView addSubview:imageView];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapped:)];
        [imageView addGestureRecognizer:tapGesture];
        imageView.tag = 1000 + i;
    }
    _scrollView.scrollsToTop = NO;
    _scrollView.contentSize = CGSizeMake(self.currentImages.count * SCREEN_WIDTH,self.frame.size.height);
    _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int16_t)(5 * NSEC_PER_SEC)),
//                   dispatch_get_main_queue(), ^{
//                       if (self.autoPlay) {
//                           [self toPlay];
//                       }
//    });
    [self performSelector:@selector(toPlay) withObject:nil afterDelay:_timeInterval];
    
}
- (void)singleTapped:(UITapGestureRecognizer *)recognizer {
//    UIImageView *imageView = (UIImageView *)recognizer.view;
//    NSInteger index = imageView.tag - 1000;
    WDWebViewController *web = [WDWebViewController webViewControllerWithURL:@"http://www.baidu.com" withTitle:@"百度一下"];
    web.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:web animated:YES];

}

- (void)toPlay{

    if (!self.autoScrollTimer || !self.autoScrollTimer.isValid) { //判断定时器是否存在或失效
        @weakify(self);
        self.autoScrollTimer = [NSTimer wd_scheduledTimerWithTimeInterval:_timeInterval withBlock:^{
                                                                         @strongify(self);
                                                                         [self autoPlayToNextPage];
                                                                     } withRepeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.autoScrollTimer forMode:NSRunLoopCommonModes];
        [self.autoScrollTimer fire];
    }

}
- (void)autoPlayToNextPage{
    
    if (_scrollView.contentOffset.x == (_imageArray.count + 1) * self.frame.size.width) {
        self.pageControl.currentPage = 0;
        [self.scrollView setContentOffset:CGPointMake(self.frame.size.width, 0)];
    } else if (_scrollView.contentOffset.x == 0) {
        self.pageControl.currentPage = _imageArray.count - 1;
        [self.scrollView setContentOffset:CGPointMake(_imageArray.count * SCREEN_WIDTH, 0)];
    } else {
        self.pageControl.currentPage = _scrollView.contentOffset.x/SCREEN_WIDTH - 1;
        [self.scrollView setContentOffset:CGPointMake((self.pageControl.currentPage + 2) * SCREEN_WIDTH, 0) animated:YES];
    }

}
- (NSMutableArray *)currentImages {
    if (_currentImages == nil) {
        _currentImages = [[NSMutableArray alloc] init];
        [_currentImages addObject:_imageArray.lastObject];
        [_currentImages addObjectsFromArray:_imageArray];
        [_currentImages addObject:_imageArray.firstObject];
    }
    return _currentImages;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.x == (_imageArray.count + 1) * self.frame.size.width) {
        self.pageControl.currentPage = 0;
        [self.scrollView setContentOffset:CGPointMake(self.frame.size.width, 0)];
    } else if (scrollView.contentOffset.x == 0) {
        self.pageControl.currentPage = _imageArray.count - 1;
        [self.scrollView setContentOffset:CGPointMake(_imageArray.count * SCREEN_WIDTH, 0)];
    } else {
        self.pageControl.currentPage = scrollView.contentOffset.x/SCREEN_WIDTH - 1;
    }
    
}
- (void)dealloc{
    [self.autoScrollTimer invalidate];
}
@end
