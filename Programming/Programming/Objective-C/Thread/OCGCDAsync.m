//
//  OCGCDAsync.m
//  Programming
//
//  Created by Peace on 7/6/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCGCDAsync.h"

@interface OCGCDAsync ()
{
    dispatch_queue_t _queue;
    dispatch_queue_t _controlQueue;
}

@end

@implementation OCGCDAsync

- (instancetype)init {
    self = [super init];
    if (self) {
        _controlQueue = dispatch_queue_create("dispatch_suspend/resume", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

#pragma mark -
#pragma mark -- Queue
//获取线程队列
- (dispatch_queue_t)dispatchQueue {
    
    //主线程
    return dispatch_get_main_queue();
    
    //高优先级
    return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    //默认优先级
    return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //低优先级
    return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    //后台优先级
    return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    //串行队列(优先级：Default)
    return dispatch_queue_create("com.example.gcd.MyQueue", DISPATCH_QUEUE_SERIAL);
    
    //并行队列(优先级：Default)
    return dispatch_queue_create("com.example.gcd.MyQueue", DISPATCH_QUEUE_CONCURRENT);
}

//设置队列优先级
- (void)setQueuePriority {
    //高优先级
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    //默认优先级
    dispatch_queue_t queue1 = dispatch_queue_create("xxxx", DISPATCH_QUEUE_SERIAL);
    //参数一：要变更优先级的队列，参数二：目标优先级队列,结果：降级
    dispatch_set_target_queue(queue, queue1);
}

#pragma mark -
#pragma mark -- Control Queue
- (void)starQueue {
    dispatch_async(_controlQueue, ^{
        NSLog(@"-1");
//        sleep(3);
        NSLog(@"1");
    });
    dispatch_async(_controlQueue, ^{
        NSLog(@"-2");
//        sleep(3);
        NSLog(@"2");
    });
    dispatch_async(_controlQueue, ^{
        NSLog(@"-3");
//        sleep(3);
        NSLog(@"3");
    });
    
    NSLog(@"-------");
    sleep(3);
    NSLog(@"=======");
}

- (void)suspend {
    dispatch_suspend(_controlQueue);
}

- (void)resume {
    dispatch_resume(_controlQueue);
}

#pragma mark -
#pragma mark -- Group
//Group
- (void)group {
    dispatch_queue_t queue = dispatch_queue_create("xxxx", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{NSLog(@"block 0");});
    dispatch_group_async(group, queue, ^{NSLog(@"block 1");});
    dispatch_group_async(group, queue, ^{NSLog(@"block 2");});
    dispatch_group_async(group, queue, ^{NSLog(@"block 3");});
    dispatch_group_async(group, queue, ^{NSLog(@"block 4");});
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"block done");
    });
}

- (void)groupEnterLeave {
    dispatch_queue_t queue = dispatch_queue_create("xxxx", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_t group = dispatch_group_create();
    
    for (int i=0;i<5;i++) {
        dispatch_group_enter(group);
        dispatch_async(queue, ^{
            NSLog(@"block %d",i);
            dispatch_group_leave(group);
        });
    }
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"block done");
    });
}

- (void)dispatchGroupWait {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_queue_t queue = dispatch_queue_create("xxxx", DISPATCH_QUEUE_CONCURRENT);
        
        dispatch_group_t group = dispatch_group_create();
        
        for (int i=0;i<5;i++) {
            dispatch_group_enter(group);
            dispatch_async(queue, ^{
                sleep(10);
                NSLog(@"block %d",i);
                dispatch_group_leave(group);
            });
        }
        
        BOOL value = YES;
        if (value) {
            dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
            NSLog(@"wait done");
        }
        else {
            dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 5*NSEC_PER_SEC);
            long result = dispatch_group_wait(group, time);
            if (result == 0) {
                NSLog(@"wait done");
            }
            else {
                NSLog(@"wait done 5");
            }
        }
    });
}

#pragma mark -
#pragma mark -- Barrier(栅栏、障碍)
- (void)barrier {
    NSLog(@"\n");
    dispatch_queue_t queue = dispatch_queue_create("dispatch_barrier", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{NSLog(@"-%daaaaaa",i);NSLog(@"%daaaaaaa",i);});
    }
    for (int i = 0; i < 10; i++) {
        dispatch_barrier_async(queue, ^{NSLog(@"-xxxxxx%d",i);NSLog(@"xxxxxx%d",i);});
    }
    
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{NSLog(@"----------%d",i);});
    }
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{NSLog(@"++++++++++%d",i);});
    }
}

#pragma mark -
#pragma mark -- Apply
- (void)dispatchApply {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_apply(10, queue, ^(size_t index) {
        NSLog(@"%zu",index);
    });
    NSLog(@"done");
}

- (void)dispatchApply1 {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        dispatch_apply(10, queue, ^(size_t index) {
            NSLog(@"%zu",index);
        });
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"done");
        });
    });
}

#pragma mark -
#pragma mark -- Deadlock
- (void)sycnDeadlock {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    NSLog(@"0");
    dispatch_async(queue, ^{
        NSLog(@"async");
    });
    NSLog(@"1");
    dispatch_sync(queue, ^{
        NSLog(@"sync");
    });
    NSLog(@"2");
    //**死锁**
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"hello");
    });
    NSLog(@"3");
}

- (void)sycnDeadlockInSubthread {
    //并行队列正常
    dispatch_queue_t concurrent_queue = dispatch_queue_create("xxccc", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrent_queue, ^{
        NSLog(@"concurrent hello");
        dispatch_sync(concurrent_queue, ^{
            NSLog(@"concurrent hello1");
        });
        NSLog(@"concurrent hello2");
    });
    
    //串行队列**死锁**
    dispatch_queue_t serial_queue = dispatch_queue_create("xxccc", DISPATCH_QUEUE_SERIAL);
    dispatch_async(serial_queue, ^{
        NSLog(@"serial hello");
        dispatch_sync(serial_queue, ^{
            NSLog(@"serial hello1");
        });
        NSLog(@"serial hello2");
    });
}


@end
