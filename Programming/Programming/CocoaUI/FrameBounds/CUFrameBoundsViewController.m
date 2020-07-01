//
//  CUFrameBoundsViewController.m
//  Objective-C
//
//  Created by Peace on 11/15/19.
//  Copyright © 2019 peace. All rights reserved.
//

#import "CUFrameBoundsViewController.h"

#import "CUFBView.h"

@implementation CUFrameBoundsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 60)];
    label.numberOfLines = 2;
    label.text = @"1.frame：为本视图位于父视图中的相对位置，\n2.bounds: 为本视图中的子视图提供坐标系。";
    [self.view addSubview:label];
    
    CGRect frameRect = CGRectMake(50, 140, 200, 300);
    CUFBView *frameView = [[CUFBView alloc] initFWithFrame:frameRect];
    [self.view addSubview:frameView];
    
    CGRect boundsRect = CGRectMake(50, 500, 200, 300);
    CUFBView *boundsView = [[CUFBView alloc] initBWithFrame:boundsRect];
    [self.view addSubview:boundsView];
}

@end
