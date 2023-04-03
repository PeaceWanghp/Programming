//
//  SwiftController.m
//  Programming
//
//  Created by heping wang on 2023/3/31.
//  Copyright © 2023 Peace. All rights reserved.
//

#import "SwiftController.h"

@interface SwiftController ()

@end

@implementation SwiftController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendHeader:@"Swift"];
    [self.model appendDarkItemWithTitle:@"面向对象" class:NSClassFromString(@"UIViewController")];
}

@end
