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
#import "OCLocksController.h"
#import "OCSyncAsyncController.h"

@interface OCThreadController ()
{
    OCThread *_thread;
}

@end

@implementation OCThreadController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _thread = [[OCThread alloc] init];
    
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
    
    [self.model appendOpenedHeader:@"GCD_Async"];
    [self.model appendDarkItemWithTitle:@"Async/sync" class:[OCSyncAsyncController class]];
    
    [self.model appendOpenedHeader:@"Lock"];
    [self.model appendItemWithTitle:@"Lock (锁)" class:[OCLocksController class]];
}

@end
