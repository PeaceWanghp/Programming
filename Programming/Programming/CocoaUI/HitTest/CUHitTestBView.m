//
//  CUHitTestBView.m
//  Programming
//
//  Created by Peace on 7/1/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "CUHitTestBView.h"

@implementation CUHitTestBView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"hitTest-------[CUHitTest_B]");
    
    if (![self pointInside:point withEvent:event]) {
        return nil;
    }
    
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan-------[CUHitTest_B]");
    [super touchesBegan:touches withEvent:event];
}

@end
