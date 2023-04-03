//
//  CUFirstTransition.m
//  Programming
//
//  Created by heping wang on 2023/3/29.
//  Copyright © 2023 Peace. All rights reserved.
//

#import "CUFirstTransition.h"

#import "CUFirstViewController.h"
#import "CUSecondViewController.h"
#import "CUItemCell.h"

@implementation CUFirstTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.9;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    CUFirstViewController *fromViewController = (CUFirstViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    CUSecondViewController *toViewController = (CUSecondViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];

    //获得cell中的图片的快照
    CUItemCell *cell = (CUItemCell*)[fromViewController.tableView cellForRowAtIndexPath:[fromViewController.tableView indexPathForSelectedRow]];
    UIView *cellImageSnapshot = [cell.leftImageView snapshotViewAfterScreenUpdates:NO];
    cellImageSnapshot.frame = [containerView convertRect:cell.leftImageView.frame fromView:cell.leftImageView.superview];
    cell.leftImageView.hidden = YES;
    
    //设置初始view的状态
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    toViewController.imageView.hidden = YES;
    
    [containerView addSubview:toViewController.view];
    [containerView addSubview:cellImageSnapshot];
    
    [UIView animateWithDuration:duration animations:^{
        toViewController.view.alpha = 1.0;
        CGRect frame = [containerView convertRect:toViewController.imageView.frame fromView:toViewController.view];
        cellImageSnapshot.frame = frame;
    } completion:^(BOOL finished) {
        toViewController.imageView.hidden = NO;
        cell.leftImageView.hidden = NO;
        [cellImageSnapshot removeFromSuperview];
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

@end
