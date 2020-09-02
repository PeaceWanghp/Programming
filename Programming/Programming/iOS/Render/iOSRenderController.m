//
//  iOSRenderController.m
//  Programming
//
//  Created by Peace on 9/2/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "iOSRenderController.h"

@interface iOSRenderController ()

@end

@implementation iOSRenderController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendItemWithTitle:@"cocoa" class:nil];
    [self.model appendItemWithTitle:@"flutter" class:nil];
    [self.model appendItemWithTitle:@"react native" class:nil];
}

@end
