//
//  CUKeyFrameAnimationViewController.m
//  Programming
//
//  Created by wangheping on 2022/10/24.
//  Copyright © 2022 Peace. All rights reserved.
//

#import "CUKeyFrameAnimationViewController.h"

@interface CUKeyFrameAnimationViewController ()

@end

@implementation CUKeyFrameAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self keyFrameAnimate];
    [self shakeToShow];
}

- (void)keyFrameAnimate {
    CGFloat x = 20;
    CGFloat y = 100;
    CGFloat width = 50;
    CGFloat height = 50;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];

    [UIView animateKeyframesWithDuration:5 delay:1 options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:.3 animations:^{
            view.frame = CGRectMake(x+100, y, width, height);
            view.backgroundColor = [UIColor blueColor];
        }];
        [UIView addKeyframeWithRelativeStartTime:.3 relativeDuration:.3 animations:^{
            view.frame = CGRectMake(x, y+100, width, height);
            view.backgroundColor = [UIColor redColor];
        }];
        [UIView addKeyframeWithRelativeStartTime:.6 relativeDuration:.3 animations:^{
            view.frame = CGRectMake(x+100, y+100, width, height);
            view.backgroundColor = [UIColor yellowColor];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.9 relativeDuration:.3 animations:^{
            view.frame = CGRectMake(x, y+100*2, width, height);
            view.backgroundColor = [UIColor purpleColor];
        }];
        [UIView addKeyframeWithRelativeStartTime:1.2 relativeDuration:.3 animations:^{
            view.frame = CGRectMake(x+100, y+100*2, width, height);
            view.backgroundColor = [UIColor greenColor];
        }];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)shakeToShow {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 160, 50, 50)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 1.6;// 动画时间
    NSMutableArray *values = [NSMutableArray array];
    // 前两个是控制view的大小的；
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [view.layer addAnimation:animation forKey:nil];
}

@end
