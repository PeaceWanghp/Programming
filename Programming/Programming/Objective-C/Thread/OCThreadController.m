//
//  OCThreadController.m
//  Programming
//
//  Created by Peace on 7/6/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCThreadController.h"

#import "OCThread.h"
#import "OCOperation.h"
#import "OCGCDAsync.h"
#import "OCLocksController.h"

@interface OCThreadController ()
{
    OCThread *_thread;
    OCGCDAsync *_gcd;
}

@end

@implementation OCThreadController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _thread = [[OCThread alloc] init];
    _gcd = [[OCGCDAsync alloc] init];
    
    [self.model appendOpenedHeader:@"pthread/GCD async 区别"];
    [self.model appendItemWithTitle:@"pthread 实现原理" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"gcd_async 实现原理" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"pthread"];
    [self.model appendDarkItemTitle:@"(POSIX(Portable Operating System Interface/可移植操作系统接口) threads)" target:_thread selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"NSThread"];
    [self.model appendDarkItemTitle:@"Start" target:_thread selector:@selector(began)];
    
    [self.model appendDarkItemTitle:@"Start Alive" target:_thread selector:@selector(startAlive)];
    [self.model appendDarkItemTitle:@"Add Task Into Alive" target:_thread selector:@selector(addTask)];
    [self.model appendDarkItemTitle:@"Cancel Alive" target:_thread selector:@selector(stop)];
    
    [self.model appendOpenedHeader:@"Operation"];
    [self.model appendItemTitle:@"..." target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"GCD Control Queue"];
    [self.model appendDarkItemTitle:@"Start" target:_gcd selector:@selector(starQueue)];
    [self.model appendDarkItemTitle:@"Suspend（悬挂）" target:_gcd selector:@selector(suspend)];
    [self.model appendDarkItemTitle:@"Resume（重新继续）" target:_gcd selector:@selector(resume)];
    [self.model appendDarkItemTitle:@"Group(组-通过block)" target:_gcd selector:@selector(group)];
    [self.model appendDarkItemTitle:@"GroupEnterLeave（组-通过信号）" target:_gcd selector:@selector(groupEnterLeave)];
    [self.model appendDarkItemTitle:@"Barrier（栅栏）" target:_gcd selector:@selector(barrier)];
    
    [self.model appendOpenedHeader:@"GCD"];
    [self.model appendDarkItemTitle:@"Sync造成主线程上死锁" target:_gcd selector:@selector(sycnDeadlock)];
    [self.model appendDarkItemTitle:@"Sync造成同一子线程上死锁" target:_gcd selector:@selector(sycnDeadlockInSubthread)];
    
    [self.model appendOpenedHeader:@"Lock"];
    [self.model appendItemWithTitle:@"Lock (锁)" class:[OCLocksController class]];
}

@end
