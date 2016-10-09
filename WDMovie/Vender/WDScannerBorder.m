//
//  WDScannerBorder.m
//  WDMovie
//
//  Created by WindyZhang on 16/10/9.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDScannerBorder.h"

@interface WDScannerBorder()
@property(nonatomic,strong) UIImageView *scannerLine;
@end

@implementation WDScannerBorder

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self prepareUI];
    }
    return self;
}

#pragma mark - 设置界面
- (void)prepareUI {
    self.clipsToBounds = YES;
    // 冲击波图像
    self.scannerLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BarCodeScanLine"]];
    self.scannerLine.frame = CGRectMake(0, 0, self.bounds.size.width, self.scannerLine.bounds.size.height);
    self.scannerLine.center = CGPointMake(self.bounds.size.width * 0.5, 0);
    [self addSubview:self.scannerLine];
    
    // 加载边框图像
    for (int i = 1; i < 5; i++) {
        NSString *imgName = [NSString stringWithFormat:@"BarCodeScan%d", i];
        UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
        
        [self addSubview:img];
        
        CGFloat offsetX = self.bounds.size.width - img.bounds.size.width;
        CGFloat offsetY = self.bounds.size.height - img.bounds.size.height;
        
        switch (i) {
            case 2:
                img.frame = CGRectOffset(img.frame, offsetX, 0);
                break;
            case 3:
                img.frame = CGRectOffset(img.frame, 0, offsetY);
                break;
            case 4:
                img.frame = CGRectOffset(img.frame, offsetX, offsetY);
                break;
            default:
                break;
        }
    }
}

#pragma mark - 扫描动画方法
// 开始扫描动画
- (void)startScannerAnimating {
    
    [self stopScannerAnimating];
    [UIView animateWithDuration:3.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [UIView setAnimationRepeatCount:MAXFLOAT];
                         
                         self.scannerLine.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height);
                     } completion:nil];
}

// 停止扫描动画
- (void)stopScannerAnimating {
    [self.scannerLine.layer removeAllAnimations];
    self.scannerLine.center = CGPointMake(self.bounds.size.width * 0.5, 0);
}



@end
