//
//  CUHitTestView.m
//  Programming
//
//  Created by Peace on 7/1/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "CUHitTestView.h"

@implementation CUHitTestView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"hitTest-------[CUHitTestView]");
    
    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) {
        return nil;
    }

    if (![self pointInside:point withEvent:event]) {
        return nil;
    }
    
    // 3、去找还有没有比自己更适合的view（也就是遍历其子控件）
    int count = (int)self.subviews.count;
    
    for (int i = count - 1; i >= 0; i--) {
        UIView *childView =  self.subviews[i];
        
        // 转换坐标系
        // 将 自己坐标系上的点 转换为 子控件坐标系上的点（以为point参数上面已经说明表示的是当前调用者上的点）
        CGPoint childPoint = [self convertPoint:point toView:childView];
        
        // 其子类的hitTest我们就不重写了，
        UIView *fitView = [childView hitTest:childPoint withEvent:event];
        
        // 如果找到最合适的view，返回。
        if (fitView) {
            return fitView;
        }
    }
    
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan-------[CUHitTestView]");
    [super touchesBegan:touches withEvent:event];
}

@end
