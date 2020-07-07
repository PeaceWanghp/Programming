//
//  OCLocksController.m
//  Programming
//
//  Created by Peace on 7/7/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCLocksController.h"

@interface OCLocksController ()

@end

@implementation OCLocksController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"NSLock"];
    [self.model appendItemTitle:@"NSLock" target:nil selector:nil];
    [self.model appendItemTitle:@"NSLock" target:nil selector:nil];
    
    [self.model appendOpenedHeader:@"GCD"];
    [self.model appendItemTitle:@"sapher" target:nil selector:nil];
    [self.model appendItemTitle:@"once" target:nil selector:nil];
    [self.model appendItemTitle:@"dispatch_sync 死锁" target:nil selector:nil];
    
    [self.model appendOpenedHeader:@"Other"];
    [self.model appendItemTitle:@"自旋锁" target:nil selector:nil];
    [self.model appendItemTitle:@"@synchronized同步锁" target:nil selector:nil];
}

@end
