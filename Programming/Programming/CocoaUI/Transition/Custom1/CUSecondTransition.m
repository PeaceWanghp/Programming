//
//  CUSecondTransition.m
//  Programming
//
//  Created by heping wang on 2023/3/29.
//  Copyright © 2023 Peace. All rights reserved.
//

#import "CUSecondTransition.h"

#import "CUFirstViewController.h"
#import "CUSecondViewController.h"
#import "CUItemCell.h"

@implementation CUSecondTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    CUSecondViewController *fromViewController = (CUSecondViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    CUFirstViewController *toViewController = (CUFirstViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    //获得要移动的图片的快照
    UIView *imageSnapshot = [fromViewController.imageView snapshotViewAfterScreenUpdates:NO];
    imageSnapshot.frame = [containerView convertRect:fromViewController.imageView.frame fromView:fromViewController.imageView.superview];
    fromViewController.imageView.hidden = YES;
    
    //获得图片对应的cell
    CUItemCell *cell = [toViewController.tableView cellForRowAtIndexPath:[toViewController.tableView indexPathForSelectedRow]];
    NSLog(@"indexPath:%@",[toViewController.tableView indexPathForSelectedRow]);
    cell.leftImageView.hidden = YES;
    
    //设置初始view的状态
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
    [containerView addSubview:imageSnapshot];
    
    [UIView animateWithDuration:duration animations:^{
        fromViewController.view.alpha = 0.0;
        imageSnapshot.frame = [containerView convertRect:cell.leftImageView.frame fromView:cell.leftImageView.superview];
    } completion:^(BOOL finished) {
        [imageSnapshot removeFromSuperview];
        fromViewController.imageView.hidden = NO;
        cell.leftImageView.hidden = NO;
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

@end
