//
//  CUSecondViewController.m
//  Programming
//
//  Created by heping wang on 2023/3/29.
//  Copyright © 2023 Peace. All rights reserved.
//

#import "CUSecondViewController.h"

#import "CUFirstViewController.h"
#import "CUSecondTransition.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface CUSecondViewController () <UINavigationControllerDelegate>
@property (strong, nonatomic) UILabel *overviewLabel;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactivePopTransition;
@end

@implementation CUSecondViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.entity.title;
    
    [self.view addSubview:self.imageView];
    self.imageView.image = self.entity.image;
    [self.view addSubview:self.overviewLabel];
    self.overviewLabel.text = self.entity.overview;
    
    [self addGesture];
    NSLog(@"%s",__func__);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.navigationController.delegate = self;
    NSLog(@"%s",__func__);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
    NSLog(@"%s",__func__);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"%s",__func__);
}

#pragma mark - Trasition Delegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (fromVC == self && [toVC isKindOfClass:[CUFirstViewController class]]) {
        CUSecondTransition *transition = [[CUSecondTransition alloc] init];
        NSLog(@"1.%p",transition);
        return transition;
    }
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    if ([animationController isKindOfClass:[CUSecondTransition class]]) {
        NSLog(@"2.%p",self.interactivePopTransition);
        return self.interactivePopTransition;
    }
    return nil;
}

#pragma mark - Gesture
- (void)addGesture {
    UIScreenEdgePanGestureRecognizer *popRegognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePopRecognizer:)];
    popRegognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:popRegognizer];
}

- (void)handlePopRecognizer:(UIScreenEdgePanGestureRecognizer*)recognizer {
    //计算用户拖动距离
    CGFloat progress = [recognizer translationInView:self.view].x / (self.view.bounds.size.width * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.interactivePopTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if(recognizer.state == UIGestureRecognizerStateChanged) {
        [self.interactivePopTransition updateInteractiveTransition:progress];
    }
    else if(recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
        if (progress > 0.5) {
            [self.interactivePopTransition finishInteractiveTransition];
        }
        else {
            [self.interactivePopTransition cancelInteractiveTransition];
        }
        
        self.interactivePopTransition = nil;
    }
    NSLog(@"recognizer.state = %d", recognizer.state);
}

#pragma mark - Lazy
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _imageView.frame = CGRectMake((ScreenWidth-200)*0.5, 50+64, 200, 200);
    }
    return _imageView;
}

- (UILabel *)overviewLabel {
    if (!_overviewLabel) {
        _overviewLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 50+64+200, 100, 300)];
        _overviewLabel.textColor = [UIColor blackColor];
        _overviewLabel.numberOfLines = 0;
    }
    return _overviewLabel;
}

@end
