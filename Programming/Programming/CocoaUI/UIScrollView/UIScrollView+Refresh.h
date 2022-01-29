//
//  UIScrollView+Refresh.h
//  Programming
//
//  Created by wangheping on 2022/1/29.
//  Copyright © 2022 Peace. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomRefreshView.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (Refresh)

@property (nonatomic,strong) CustomRefreshView *topShowView;
 
-(void)addHeaderRefreshWithTarget:(id)target action:(SEL)action;
 
-(void)beginHeaderRefresh;
-(void)endHeaderRefresh;

@end

NS_ASSUME_NONNULL_END
