//
//  OCThread.m
//  Programming
//
//  Created by Peace on 7/6/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCThread.h"

@interface OCThread ()
{
    NSThread *_thread;
    NSThread *_aliveThread;
}
@end

@implementation OCThread

#pragma mark -
#pragma mark -- Life Cycle
- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"%s",__func__);
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(exitNotification)
                                                     name:NSWillBecomeMultiThreadedNotification
                                                   object:_thread];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(exitNotification)
                                                     name:NSDidBecomeSingleThreadedNotification
                                                   object:_thread];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(exitNotification)
                                                     name:NSThreadWillExitNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

#pragma mark -
#pragma mark -- Notification
- (void)multiThreadNotification {
    NSLog(@"%s",__func__);
}

- (void)singleThreadNotification {
    NSLog(@"%s",__func__);
}

- (void)exitNotification {
    NSLog(@"%s",__func__);
}

#pragma mark -
#pragma mark -- Once
- (void)began {
    [NSThread detachNewThreadWithBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
}

#pragma mark -
#pragma mark -- Alive
- (void)startAlive {
    _aliveThread = [[NSThread alloc] initWithBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        [runLoop run];
    }];
    
    [_aliveThread start];
}

- (void)addTask {
    [self performSelector:@selector(taskAction) onThread:_aliveThread withObject:self waitUntilDone:YES];
}

- (void)taskAction {
    NSLog(@"%s : %@",__func__,[NSThread currentThread]);
}

- (void)stop {
    [self performSelector:@selector(finish) onThread:_aliveThread withObject:self waitUntilDone:YES];
}

- (void)finish {
    NSLog(@"%s : %@",__func__,[NSThread currentThread]);
    CFRunLoopStop(CFRunLoopGetCurrent());
    [_aliveThread cancel];
}

@end
