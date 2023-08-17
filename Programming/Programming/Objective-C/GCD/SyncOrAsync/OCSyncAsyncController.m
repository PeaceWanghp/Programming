//
//  OCSyncAsyncController.m
//  Programming
//
//  Created by Peace on 11/4/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCSyncAsyncController.h"

@interface OCSyncAsyncController ()
{
    dispatch_queue_t _queue;
}
@end

@implementation OCSyncAsyncController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _queue = dispatch_queue_create("xxxx", DISPATCH_QUEUE_SERIAL);
    
    [self.model appendOpenedHeader:@"应用："];
    
    [self.model appendDarkItemTitle:@"Sync做栅栏" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"同一队列Sync死锁" target:self selector:@selector(todo1)];
    
    [self.model appendDarkItemTitle:@"同一线程死锁" target:self selector:@selector(todo2)];
    [self.model appendDarkItemTitle:@"" target:self selector:@selector(todo3)];
}

- (void)todo {
//    _queue = dispatch_queue_create("xxxx", DISPATCH_QUEUE_SERIAL);
    _queue = dispatch_queue_create("xxxx", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"000000 %@",[NSThread currentThread]);
    
    dispatch_async(_queue, ^{
        NSLog(@"_1111");
        sleep(1);
        NSLog(@"1111 %@",[NSThread currentThread]);
    });
    
    dispatch_async(_queue, ^{
        NSLog(@"_22222");
        sleep(1);
        NSLog(@"22222 %@",[NSThread currentThread]);
    });
    
    dispatch_sync(_queue, ^{
        NSLog(@"_33333");
        sleep(2);
        NSLog(@"33333 %@",[NSThread currentThread]);
    });
    
    dispatch_async(_queue, ^{
        NSLog(@"_44444");
        sleep(1);
        NSLog(@"44444 %@",[NSThread currentThread]);
    });
    
    dispatch_async(_queue, ^{
        NSLog(@"_55555");
        sleep(1);
        NSLog(@"55555 %@",[NSThread currentThread]);
    });
    
    NSLog(@"-------- %@",[NSThread currentThread]);
}

- (void)todo1 {
    dispatch_async(_queue, ^{
        [self todo];
    });
}

- (void)todo2 {
    NSLog(@"%@",[NSThread currentThread]);
    
    dispatch_queue_t queue = dispatch_queue_create("ooooooo", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        NSLog(@"_1111");
        sleep(1);
        NSLog(@"1111 %@",[NSThread currentThread]);
    });
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"_2222");
        sleep(1);
        NSLog(@"2222 %@",[NSThread currentThread]);
    });
    
    NSLog(@"333333 %@",[NSThread currentThread]);
}

- (void)todo3 {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self todo2];
    });
}

@end
