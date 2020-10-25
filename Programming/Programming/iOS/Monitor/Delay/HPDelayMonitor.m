//
//  HPDelayMonitor.m
//  Programming
//
//  Created by Peace on 9/28/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "HPDelayMonitor.h"

#import "QiCallStack.h"

@interface HPDelayMonitor ()
{
    //runloop
    CFRunLoopObserverRef _runLoopObserver;
    CFRunLoopActivity _runLoopActivity;
    
    //thread
    dispatch_semaphore_t _dispatchSemaphore;
    int _timeoutCount;
}
@end

@implementation HPDelayMonitor

#pragma mark -
#pragma mark -- Life Cycle
- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

#pragma mark -
#pragma mark -- Public
- (void)begin {
    [self addObserver];
    
    [self monitor];
}

- (void)end {
    if (!_runLoopObserver) {
        return;
    }
    
    [self removeObserver];
}

#pragma mark -
#pragma mark -- Monitor
- (void)monitor {
    _dispatchSemaphore = dispatch_semaphore_create(0);
    
    dispatch_async(dispatch_queue_create("monitorQueue", DISPATCH_QUEUE_SERIAL), ^{
        while (YES) {
            dispatch_time_t time_t = dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC);
            long semaphoreWait = dispatch_semaphore_wait(self->_dispatchSemaphore, time_t);
            if (semaphoreWait != 0) {
                if (!self->_runLoopObserver) {
                    return;
                }
                
                if (self->_runLoopActivity == kCFRunLoopBeforeSources ||
                    self->_runLoopActivity == kCFRunLoopBeforeWaiting) {
                    if (++self->_timeoutCount < 3) {
                        continue;
                    }
                
                    NSString *stackStr = [QiCallStack callStackWithType:QiCallStackTypeMain];
                    NSLog(@"Warning:------------>Delay!!!!!\n%@",stackStr);
                }
            }
            
            self->_timeoutCount = 0;
        }
    });
}

- (void)monitorSemaphore {
    dispatch_semaphore_signal(_dispatchSemaphore);
}

#pragma mark -
#pragma mark -- Observer
- (void)addObserver {
    CFRunLoopObserverContext context = {0,(__bridge void*)self,NULL,NULL};
    _runLoopObserver = CFRunLoopObserverCreate(kCFAllocatorDefault,
                                               kCFRunLoopAllActivities,
                                               YES,
                                               0,
                                               &runLoopObserverCallBack,
                                               &context);
    CFRunLoopAddObserver(CFRunLoopGetMain(), _runLoopObserver, kCFRunLoopCommonModes);
}

- (void)removeObserver {
    CFRunLoopRemoveObserver(CFRunLoopGetMain(), _runLoopObserver, kCFRunLoopCommonModes);
    CFRelease(_runLoopObserver);
    _runLoopObserver = NULL;
}

static void runLoopObserverCallBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    NSLog(@"activity = %lu",activity);
    HPDelayMonitor *monitor = (__bridge HPDelayMonitor*)info;
    monitor->_runLoopActivity = activity;
    
    [monitor monitorSemaphore];
    
//    [[NSMachPort port] sendBeforeDate:[NSDate date] components:nil from:nil reserved:0];
}

/*
 Run Loop Observer Activities
 
typedef CF_OPTIONS(CFOptionFlags, CFRunLoopActivity) {
    kCFRunLoopEntry = (1UL << 0),           --->1    运行runloop的入口
    kCFRunLoopBeforeTimers = (1UL << 1),    --->2    在处理任何Timer计时器之前
    kCFRunLoopBeforeSources = (1UL << 2),   --->4    在处理任何Sources源之前
    kCFRunLoopBeforeWaiting = (1UL << 5),   --->32   在等待源Source和计时器Timer之前
    kCFRunLoopAfterWaiting = (1UL << 6),    --->64   在等待源Source和计时器Timer后，同时在被唤醒之前
    kCFRunLoopExit = (1UL << 7),            --->128  runloop的出口
    kCFRunLoopAllActivities = 0x0FFFFFFFU   --->     runloop的所有状态
};
 */

@end
