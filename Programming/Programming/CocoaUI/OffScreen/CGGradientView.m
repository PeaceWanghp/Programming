//
//  CGOffscreenGradientView.m
//  Programming
//
//  Created by Peace on 7/3/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "CGGradientView.h"

@implementation CGGradientView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
         CAGradientLayer *gradientLayer = [CAGradientLayer layer];
         gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
         gradientLayer.locations = @[@0.3, @0.5, @1.0];
         gradientLayer.startPoint = CGPointMake(0, 0);
         gradientLayer.endPoint = CGPointMake(1.0, 0);
         gradientLayer.frame = CGRectMake(0, 100, 300, 100);
         [self.layer addSublayer:gradientLayer];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
