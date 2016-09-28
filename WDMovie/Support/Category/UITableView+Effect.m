//
//  UITableView+Effect.m
//  WDMovie
//
//  Created by WindyZhang on 16/9/28.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "UITableView+Effect.h"

@implementation UITableView (Effect)

- (void)hiddenExtraCellLine{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    self.tableFooterView = view;
}

@end
