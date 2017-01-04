//
//  WDAutoScrollerView.m
//  WDMovie
//
//  Created by WindyZhang on 16/9/28.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDAutoScrollerView.h"

@interface WDAutoScrollerView()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,assign)int currentPage;
@property(nonatomic,assign)BOOL autoPlay;
@property(nonatomic,assign)NSTimeInterval timeInterval;
@property(nonatomic,strong)NSMutableArray *currentImages;
@property(nonatomic,copy)NSArray *imageArray;

@end

@implementation WDAutoScrollerView

- (instancetype)initWithFrame:(CGRect)frame
                   withImages:(NSArray*)images
                 withAutoPlay:(BOOL)isAuto
                    withDelay:(NSTimeInterval)timeInterval{
    if (self = [super initWithFrame:frame]) {
        _imageArray = images;
        _autoPlay = isAuto;
        _timeInterval = timeInterval;
        _currentPage = 0;
        [self addScrollView];
        [self addPageControl];
        if (self.autoPlay) {
            [self toPlay];
        }
    }
    return self;
}
- (void)addPageControl {

    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 20, SCREEN_WIDTH, 20)];
    backView.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.2];
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    pageControl.numberOfPages = self.imageArray.count;
    pageControl.currentPage = 0;
    pageControl.userInteractionEnabled = NO;
    _pageControl = pageControl;
    [backView addSubview:self.pageControl];
    [self addSubview:backView];
}
- (void)addScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    for (int i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, self.frame.size.height)];
        imageView.image = [UIImage imageNamed:self.currentImages[i]];
        [scrollView addSubview:imageView];
    }
    scrollView.scrollsToTop = NO;
    scrollView.contentSize = CGSizeMake(3*SCREEN_WIDTH, self.frame.size.height);
    scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapped:)];
    [scrollView addGestureRecognizer:tap];
    
    [self addSubview:scrollView];
    _scrollView = scrollView;
}
- (void)singleTapped:(UITapGestureRecognizer *)recognizer {
    if ([self.delegate respondsToSelector:@selector(loopViewDidSelectedImage:withIndex:)]) {
        [self.delegate loopViewDidSelectedImage:self withIndex:_currentPage];
    }
}

- (void)toPlay{
    [self performSelector:@selector(autoPlayToNextPage) withObject:nil afterDelay:_timeInterval];
}
- (void)autoPlayToNextPage{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(autoPlayToNextPage) object:nil];
    [self.scrollView setContentOffset:CGPointMake(self.frame.size.width * 2, 0) animated:YES];
    [self performSelector:@selector(autoPlayToNextPage) withObject:nil afterDelay:_timeInterval];
}
- (NSMutableArray *)currentImages {
    if (_currentImages == nil) {
        _currentImages = [[NSMutableArray alloc] init];
    }
    [_currentImages removeAllObjects];
    NSInteger count = self.imageArray.count;
    int i = (int)(_currentPage + count - 1)%count;
    [_currentImages addObject:self.imageArray[i]];
    [_currentImages addObject:self.imageArray[_currentPage]];
    i = (int)(_currentPage + 1)%count;
    [_currentImages addObject:self.imageArray[i]];
    return _currentImages;
}

- (void)refreshImages {
    NSArray *subViews = self.scrollView.subviews;
    for (int i = 0; i < subViews.count; i++) {
        UIImageView *imageView = (UIImageView *)subViews[i];
        imageView.image = [UIImage imageNamed:self.currentImages[i]];
    }
    [self.scrollView setContentOffset:CGPointMake(self.frame.size.width, 0)];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.contentOffset.x >= 2 * self.frame.size.width) {
        _currentPage = (++_currentPage) % self.imageArray.count;
        self.pageControl.currentPage = _currentPage;
        [self refreshImages];
    }
    if (scrollView.contentOffset.x <= 0) {
        _currentPage = (int)(_currentPage + self.imageArray.count - 1)%self.imageArray.count;
        self.pageControl.currentPage = _currentPage;
        [self refreshImages];
    }

}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [scrollView setContentOffset:CGPointMake(self.frame.size.width, 0) animated:YES];
}


@end
