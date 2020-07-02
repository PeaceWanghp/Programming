//
//  CUHitTestViewController.m
//  Programming
//
//  Created by Peace on 7/1/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "CUHitTestController.h"

#import "CUHitTestView.h"
#import "CUHitTestAView.h"
#import "CUHitTestBView.h"

@interface CUHitTestController ()

@end

@implementation CUHitTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect rect = [UIScreen mainScreen].bounds;
    self.view = [[CUHitTestView alloc] initWithFrame:rect];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200)];
    label.numberOfLines = 0;
    label.text = @"hitTest:\n touch(UIEvent)->UIApplication->UIWindow->window.subviews->...->view(目标视图)\n\n响应链:\n view -> superView ...- > UIViewController.view -> UIViewController -> UIWindow -> UIApplication -> 事件丢弃";
    [self.view addSubview:label];
    
    CUHitTestAView *aView = [[CUHitTestAView alloc] initWithFrame:CGRectMake(50, 300, 100, 50)];
    aView.backgroundColor = [UIColor redColor];
    [self.view addSubview:aView];
    
    CUHitTestBView *bView = [[CUHitTestBView alloc] initWithFrame:CGRectMake(50, 360, 100, 50)];
    bView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:bView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan-------[CUHitTestViewController]");
    [super touchesBegan:touches withEvent:event];
}

@end
