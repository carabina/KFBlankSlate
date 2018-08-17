//
//  KFBlankSlateHandler.m
//  KFBlankSlateExample
//
//  Created by carefree on 2018/8/16.
//  Copyright © 2018年 Carefree. All rights reserved.
//

#import "KFBlankSlateHandler.h"

@implementation KFBlankSlateHandler

#pragma mark - Lifecycle
- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    [self configure];
    
    return self;
}

#pragma mark - Setter
- (void)setScrollView:(UIScrollView *)scrollView {
    // 不是UIScrollView，则返回
    if (scrollView && ![scrollView isKindOfClass:[UIScrollView class]]) return;
    
    scrollView.emptyDataSetSource = self;
    scrollView.emptyDataSetDelegate = self;
    _scrollView = scrollView;
}

- (void)setState:(KFDataLoadState)state {
    _state = state;
    [self.scrollView reloadEmptyDataSet];
}

#pragma mark - Other
- (void)configure {
    //初始配置写在这里
    self.state = KFDataLoadStateReady;
}

@end