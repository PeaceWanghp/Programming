//
//  OCSemaphoreController.m
//  Programming
//
//  Created by Peace on 9/24/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCSemaphoreController.h"

@interface OCSemaphoreController ()

@end

@implementation OCSemaphoreController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self.model appendOpenedHeader:@"原理："];
    [self.model appendItemTitle:@"底层实现" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"阻塞方式do_while" target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"概念"];
    [self.model appendItemTitle:@"信号=0阻塞，>0通过" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"dispatch_semaphore_create(long value); // 创建信号量"
                         target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout); // 等待信号量"
                         target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"dispatch_semaphore_signal(dispatch_semaphore_t deem); // 发送信号量"
                         target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"用法"];
    [self.model appendDarkItemTitle:@"基本用法" target:self selector:@selector(testSemaphore)];
    [self.model appendDarkItemTitle:@"基本用法2" target:self selector:@selector(testSemaphore2)];
}

//初始化信号量
- (void)testSemaphore {
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"1:%@",[NSThread currentThread]);
        sleep(1);
        dispatch_semaphore_signal(sema);
    });
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"2:%@",[NSThread currentThread]);
        dispatch_semaphore_signal(sema);
    });
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"3:%@",[NSThread currentThread]);
    });
}

//初始化多个信号量
- (void)testSemaphore2 {
    dispatch_semaphore_t sema = dispatch_semaphore_create(3);
    dispatch_queue_t queue = dispatch_queue_create("xxx.ccc", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        NSLog(@"1");
        sleep(1);
        NSLog(@"1:%@",[NSThread currentThread]);
        dispatch_semaphore_signal(sema);
    });
    
    dispatch_async(queue, ^{
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        NSLog(@"2");
        sleep(1);
        NSLog(@"2:%@",[NSThread currentThread]);
        dispatch_semaphore_signal(sema);
    });
    
    dispatch_async(queue, ^{
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        NSLog(@"3");
        sleep(1);
        NSLog(@"3:%@",[NSThread currentThread]);
        dispatch_semaphore_signal(sema);
    });
    
    NSLog(@"0-0");
}

@end
