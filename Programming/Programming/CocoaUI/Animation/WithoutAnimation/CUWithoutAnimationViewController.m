//
//  CUWithoutAnimationViewController.m
//  Programming
//
//  Created by wangheping on 2022/10/24.
//  Copyright © 2022 Peace. All rights reserved.
//

#import "CUWithoutAnimationViewController.h"

@interface CUWithoutAnimationViewController ()

@end

@implementation CUWithoutAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self inAnimationBlockAnimation];
    [self inAnimationBlockWithoutAnimation];
    [self testAnimation];
}

// 有动画
- (void)inAnimationBlockAnimation {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 50, 50)];
    view.backgroundColor = UIColor.blackColor;
    [self.view addSubview:view];
    
    [UIView animateWithDuration:2 animations:^{
        CGRect rect = view.frame;
        rect.origin.x = 200;
        view.frame = rect;
        
        view.backgroundColor = [UIColor blueColor];
    }];
}

// 无动画
- (void)inAnimationBlockWithoutAnimation {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 50, 50)];
    view.backgroundColor = UIColor.redColor;
    [self.view addSubview:view];
    
    [UIView animateWithDuration:2 animations:^{
        CGRect rect = view.frame;
        rect.origin.x = 200;
        view.frame = rect;
        
        [UIView performWithoutAnimation:^{
            view.backgroundColor = [UIColor blueColor];
        }];
    }];
}

- (void)testAnimation {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 50, 50)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];

    UIView *view_1 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
    view_1.backgroundColor = [UIColor redColor];
    [view addSubview:view_1];

    [UIView animateKeyframesWithDuration:3
                                   delay:3
                                 options:UIViewKeyframeAnimationOptionRepeat|UIViewKeyframeAnimationOptionAutoreverse
                              animations:^{
        view.frame = CGRectMake(100, 100, 50, 50);
        [UIView performWithoutAnimation:^{
            view.backgroundColor = [UIColor blueColor];
        }];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView performSystemAnimation:UISystemAnimationDelete
                               onViews:@[view_1]
                               options:0
                               animations:^{
        view_1.alpha = 0;
    } completion:^(BOOL finished) {
        
    }];
}

@end
