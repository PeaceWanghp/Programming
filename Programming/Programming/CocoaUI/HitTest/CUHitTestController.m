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
    
    self.view = [[CUHitTestView alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 60)];
    label.numberOfLines = 2;
    label.text = @"触发链：hitTest 自下而上\n处理链：从当前视图自上而下处理。";
    [self.view addSubview:label];
    
    CUHitTestAView *aView = [[CUHitTestAView alloc] initWithFrame:CGRectMake(50, 200, 100, 50)];
    aView.backgroundColor = [UIColor redColor];
    [self.view addSubview:aView];
    
    CUHitTestBView *bView = [[CUHitTestBView alloc] initWithFrame:CGRectMake(50, 260, 100, 50)];
    bView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:bView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan-------[CUHitTestViewController]");
    [super touchesBegan:touches withEvent:event];
}

@end
