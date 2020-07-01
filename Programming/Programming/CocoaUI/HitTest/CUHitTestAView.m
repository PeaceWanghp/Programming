//
//  CUHitTestAView.m
//  Programming
//
//  Created by Peace on 7/1/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "CUHitTestAView.h"

@implementation CUHitTestAView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"hitTest-------[CUHitTest_A]");
    
    if (![self pointInside:point withEvent:event]) {
        return nil;
    }
    
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan-------[CUHitTest_A]");
    [super touchesBegan:touches withEvent:event];
}

@end
