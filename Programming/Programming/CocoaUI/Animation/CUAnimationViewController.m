//
//  CUAnimationViewController.m
//  Programming
//
//  Created by wangheping on 2022/10/21.
//  Copyright © 2022 Peace. All rights reserved.
//

#import "CUAnimationViewController.h"

@interface CUAnimationViewController ()

@end

@implementation CUAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Animation";
    
    [self.model appendDarkItemWithTitle:@"LineAnimation(直线动画)"
                                  class:NSClassFromString(@"CULineAnimationViewController")];
    [self.model appendDarkItemWithTitle:@"SpringAnimation(弹簧动画)"
                                  class:NSClassFromString(@"CUSpringAnimationViewController")];
    [self.model appendDarkItemWithTitle:@"TransitionAnimation(过度动画)"
                                  class:NSClassFromString(@"CUTransitionAnimationViewController")];
    [self.model appendDarkItemWithTitle:@"KeyFrameAnimation(关键帧动画)"
                                  class:NSClassFromString(@"CUKeyFrameAnimationViewController")];
    [self.model appendDarkItemWithTitle:@"UIBezierPathAnimation(抛物线动画)"
                                  class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"CAAnimationGroup(组合动画)"
                                  class:NSClassFromString(@"CUGroupAnimationViewController")];
    [self.model appendDarkItemWithTitle:@"WithoutAnimation(在动画block中没有动画)"
                                  class:NSClassFromString(@"CUWithoutAnimationViewController")];
}

@end
