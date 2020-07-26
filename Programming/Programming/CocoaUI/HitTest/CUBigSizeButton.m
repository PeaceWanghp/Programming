//
//  CUBigSizeButton.m
//  Programming
//
//  Created by Peace on 7/22/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "CUBigSizeButton.h"

@implementation CUBigSizeButton

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"0.%@",NSStringFromCGPoint(point));
    
    NSLog(@"1.%@",NSStringFromCGRect(self.bounds));
    NSLog(@"1.1.%@",NSStringFromCGRect(self.frame));
    
    CGRect bounds = CGRectMake(-20, -20, self.bounds.size.width+40, self.bounds.size.height+40);
    NSLog(@"2.%@",NSStringFromCGRect(bounds));
    
    return CGRectContainsPoint(bounds, point);
}

@end
