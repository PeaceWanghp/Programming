//
//  CUTransitionAnimationViewController.m
//  Programming
//
//  Created by wangheping on 2022/10/21.
//  Copyright © 2022 Peace. All rights reserved.
//

#import "CUTransitionAnimationViewController.h"

static CGFloat viewWidth = 50;
static CGFloat viewHeight = 20;

@interface CUTransitionAnimationViewController ()

@end

@implementation CUTransitionAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //    UIViewAnimationOptionTransitionNone            //无转场动画
    //    UIViewAnimationOptionTransitionFlipFromLeft    //转场从左翻转
    //    UIViewAnimationOptionTransitionFlipFromRight   //转场从右翻转
    //    UIViewAnimationOptionTransitionCurlUp          //上卷转场
    //    UIViewAnimationOptionTransitionCurlDown        //下卷转场
    //    UIViewAnimationOptionTransitionCrossDissolve   //转场交叉消失
    //    UIViewAnimationOptionTransitionFlipFromTop     //转场从上翻转
    //    UIViewAnimationOptionTransitionFlipFromBottom  //转场从下翻转
    [self transitionAnimationColor:[UIColor redColor] index:0 option:UIViewAnimationOptionTransitionNone];
    [self transitionAnimationColor:[UIColor blackColor] index:1 option:UIViewAnimationOptionTransitionFlipFromLeft];
    [self transitionAnimationColor:[UIColor yellowColor] index:2 option:UIViewAnimationOptionTransitionFlipFromRight];
    [self transitionAnimationColor:[UIColor purpleColor] index:3 option:UIViewAnimationOptionTransitionCurlUp];
    [self transitionAnimationColor:[UIColor grayColor] index:4 option:UIViewAnimationOptionTransitionCurlDown];
    [self transitionAnimationColor:[UIColor greenColor] index:5 option:UIViewAnimationOptionTransitionCrossDissolve];
    [self transitionAnimationColor:[UIColor blueColor] index:6 option:UIViewAnimationOptionTransitionFlipFromTop];
    [self transitionAnimationColor:[UIColor orangeColor] index:7 option:UIViewAnimationOptionTransitionFlipFromBottom];
}

// Transition animation
- (void)transitionAnimationColor:(UIColor *)color index:(NSInteger)index option:(UIViewAnimationOptions)option {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 100+index*viewHeight, viewWidth, viewHeight)];
    view.backgroundColor = color;
    [self.view addSubview:view];
    
    [UIView animateWithDuration:2
                          delay:1
                        options:option
                     animations:^{
        CGAffineTransform transform = CGAffineTransformIdentity;
        transform = CGAffineTransformMakeTranslation(100, 0.0);
        transform = CGAffineTransformScale(transform, -1.0, 1.0); //沿y轴向左翻
        view.transform = transform;
    } completion:^(BOOL finished) {
        NSLog(@"animation finished");
    }];
}

@end
