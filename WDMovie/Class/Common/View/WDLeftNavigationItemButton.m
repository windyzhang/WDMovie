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
    imageView.image = [UIImage imageNamed:@"userIcon.jpg"];
    [self addSubview:imageView];
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openDrawer:)];
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:tapGr];
    
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = imageView.frame.size.width * 0.5;
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
