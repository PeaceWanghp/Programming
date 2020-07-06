//
//  OC_Test_NSTimer.m
//  Objective-C
//
//  Created by Peace on 12/2/19.
//  Copyright © 2019 peace. All rights reserved.
//

#import "OC_Test_NSTimer.h"

#import "NSWeakTimer.h"

@interface OC_Test_NSTimer() {
    NSTimer *_timer;
}

@end

@implementation OC_Test_NSTimer

- (void)dealloc {
    NSLog(@"%s",__func__);
}

#pragma mark -
#pragma mark -- NSTimer
//普通计时器
- (void)startTimer {
    _timer = [NSTimer timerWithTimeInterval:2.0
                                             target:self
                                           selector:@selector(timerRun)
                                           userInfo:nil
                                            repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
}

#pragma mark -
#pragma mark -- Weak Timer
- (void)startWeakTimer {
    _timer = [NSWeakTimer timerWithTimeInterval:2.0
                                             target:self
                                           selector:@selector(timerRun)
                                           userInfo:nil
                                            repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
}

#pragma mark -
#pragma mark -- Exact(精准的) Timer
- (void)startExactTimer {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_queue_create("com.timer.exact", DISPATCH_QUEUE_SERIAL), ^{
        [weakSelf startWeakTimer];
        
        [[NSRunLoop currentRunLoop] run];
    });
}

#pragma mark -
#pragma mark -- Control
- (void)invalidateTimer {
    [_timer invalidate];
}

- (void)fireTimer {
    [_timer fire];
}

#pragma mark -
#pragma mark -- Run
- (void)timerRun {
    NSLog(@"%s : %@ : %@",__func__,[NSThread currentThread],[NSRunLoop currentRunLoop].currentMode);
    dispatch_async(dispatch_queue_create("xxxx", DISPATCH_QUEUE_SERIAL), ^{
        sleep(4);
    });
}

@end
