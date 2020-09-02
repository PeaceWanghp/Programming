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
    [self.model appendItemTitle:@"NSLock 对象锁" target:nil selector:nil];
    [self.model appendItemTitle:@"NSRecursiveLock 递归锁" target:nil selector:nil];
    [self.model appendItemTitle:@"NSConditionLock 条件锁" target:nil selector:nil];
    
    [self.model appendOpenedHeader:@"GCD"];
    [self.model appendItemTitle:@"dispatch_semaphore 信号量" target:nil selector:nil];
    [self.model appendItemTitle:@"once" target:nil selector:nil];
    [self.model appendItemTitle:@"dispatch_sync 死锁" target:nil selector:nil];
    
    [self.model appendOpenedHeader:@"Other"];
    [self.model appendItemTitle:@"OSSpinLock 自旋锁" target:nil selector:nil];
    [self.model appendItemTitle:@"@synchronized 同步锁" target:nil selector:nil];
    [self.model appendItemTitle:@"pthread_mutex 互斥锁（C语言）" target:nil selector:nil];
}

@end
