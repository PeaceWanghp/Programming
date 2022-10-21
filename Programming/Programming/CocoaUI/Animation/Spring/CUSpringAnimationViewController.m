//
//  CUSpringAnimationViewController.m
//  Programming
//
//  Created by wangheping on 2022/10/21.
//  Copyright © 2022 Peace. All rights reserved.
//

#import "CUSpringAnimationViewController.h"

@interface CUSpringAnimationViewController ()

@end

@implementation CUSpringAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self animationColor:[UIColor blueColor] index:0 damping:0.1 velocity:0.1];
    [self animationColor:[UIColor orangeColor] index:1 damping:0.1 velocity:0.5];
    [self animationColor:[UIColor yellowColor] index:2 damping:0.1 velocity:1.0];
    
    [self animationColor:[UIColor blueColor] index:4 damping:1 velocity:0.1];
    [self animationColor:[UIColor orangeColor] index:5 damping:1 velocity:0.5];
    [self animationColor:[UIColor systemPinkColor] index:6 damping:1 velocity:1.0];
}

- (void)animationColor:(UIColor *)color index:(NSInteger)index damping:(CGFloat)damping velocity:(CGFloat)velocity {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 100+index*50, 50, 50)];
    view.backgroundColor = color;
    [self.view addSubview:view];
    
    // damping: 弹簧的阻尼（值0～1）,数值越大移动弹跳距离约小
    // velocity: 弹簧的速率（值0～1），数值越大动力越大（速度越快）
    [UIView animateWithDuration:2
                          delay:1
         usingSpringWithDamping:damping
          initialSpringVelocity:velocity
                        options:UIViewAnimationOptionRepeat
                    animations:^{
       view.center = CGPointMake(self.view.frame.size.width-50, view.center.y);
    } completion:^(BOOL finished) {
        
    }];
}

@end
