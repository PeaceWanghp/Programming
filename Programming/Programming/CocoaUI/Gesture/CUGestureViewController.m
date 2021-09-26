//
//  CUGestureViewController.m
//  Programming
//
//  Created by wangheping on 2021/9/24.
//  Copyright © 2021 Peace. All rights reserved.
//

#import "CUGestureViewController.h"

#import "CUTestPanViewController.h"

@interface CUGestureViewController ()

@end

@implementation CUGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.model appendDarkItemWithTitle:@"ScrollView" class:[CUTestPanViewController class]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
