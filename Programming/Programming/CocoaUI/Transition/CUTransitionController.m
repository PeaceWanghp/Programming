//
//  CUTransitionController.m
//  Programming
//
//  Created by heping wang on 2023/3/29.
//  Copyright © 2023 Peace. All rights reserved.
//

#import "CUTransitionController.h"

@interface CUTransitionController ()

@end

@implementation CUTransitionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"转场动画列表"];
    [self.model appendDarkItemWithTitle:@"Push / Pop" class:NSClassFromString(@"CUFirstViewController")];
    [self.model appendDarkItemWithTitle:@"Present / Dismiss" class:NSClassFromString(@"CUFirstViewController")];
    [self.model appendDarkItemWithTitle:@"Custom 1 FromTo" class:NSClassFromString(@"CUFirstViewController")];
    [self.model appendDarkItemWithTitle:@"Custom 1 FromTo" class:NSClassFromString(@"CUFirstViewController")];
    
}

@end
