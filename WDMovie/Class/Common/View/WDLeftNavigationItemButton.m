//
//  WDLeftNavigationItemButton.m
//  WDMovie
//
//  Created by WindyZhang on 16/8/9.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDLeftNavigationItemButton.h"
#import "AppDelegate.h"

@implementation WDLeftNavigationItemButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    imageView.layer.cornerRadius = imageView.frame.size.width * 0.5;
    imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    imageView.layer.borderWidth = 1.5;
    imageView.layer.masksToBounds = YES;
    imageView.image = [UIImage imageNamed:@"userIcon"];
    imageView.userInteractionEnabled = YES;
    [self addSubview:imageView];
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openDrawer:)];
    [imageView addGestureRecognizer:tapGr];
    
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    [app.drawer hiddenHeadView:^(CGFloat alpha) {
        imageView.alpha = alpha;
    }];
    
}

- (void)openDrawer:(UITapGestureRecognizer *)sender{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    [app.drawer open];
}

@end
