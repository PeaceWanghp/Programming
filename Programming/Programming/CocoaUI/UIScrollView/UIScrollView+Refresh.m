//
//  UIScrollView+Refresh.m
//  Programming
//
//  Created by wangheping on 2022/1/29.
//  Copyright © 2022 Peace. All rights reserved.
//

#import "UIScrollView+Refresh.h"

#import <objc/runtime.h>
#define kObservePath        @"contentOffset"

@implementation UIScrollView (Refresh)

static char topShowViewKey;
 
-(void)addHeaderRefreshWithTarget:(id)target action:(SEL)action
{
    if (!self.topShowView)
    {
        self.topShowView = [[CustomRefreshView alloc] init];
    }
    self.topShowView.frame = CGRectMake(0, -100, self.frame.size.width, 100);
    self.topShowView.backgroundColor = [UIColor redColor];
    self.topShowView.parentView = self;
    self.topShowView.actionTarget = target;
    self.topShowView.action = action;
    [self addSubview:self.topShowView];
    
    [self addObserver:self forKeyPath:kObservePath options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([kObservePath isEqualToString:keyPath]){
        NSValue *point = (NSValue *)[change objectForKey:@"new"];
        CGPoint p = [point CGPointValue];
        NSLog(@"--- %@",NSStringFromCGPoint(p));
        [self.topShowView adjustY:-p.y];
    }
}
 
-(void)beginHeaderRefresh
{
    [self.topShowView beginHeaderRefresh];
}
-(void)endHeaderRefresh
{
    [self.topShowView endHeaderRefresh];
}

-(CustomRefreshView *)topShowView
{
    return objc_getAssociatedObject(self, &topShowViewKey);
}
 
-(void)setTopShowView:(CustomRefreshView *)topShowView
{
    objc_setAssociatedObject(self, &topShowViewKey, topShowView, OBJC_ASSOCIATION_RETAIN);
}

@end
