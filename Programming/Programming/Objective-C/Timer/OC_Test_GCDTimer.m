//
//  OC_Test_GCDTimer.m
//  Objective-C
//
//  Created by Peace on 12/2/19.
//  Copyright © 2019 peace. All rights reserved.
//

#import "OC_Test_GCDTimer.h"

@interface OC_Test_GCDTimer ()
{
    dispatch_source_t _timer;
}
@end

@implementation OC_Test_GCDTimer

- (void)dealloc {
    NSLog(@"%s",__func__);
}

- (void)startTimer {
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    
    dispatch_source_set_timer(_timer, dispatch_time(DISPATCH_TIME_NOW, 0ull*NSEC_PER_SEC), 3 * NSEC_PER_SEC, 0ull*NSEC_PER_SEC);
    
    dispatch_source_set_event_handler(_timer, ^{
        NSLog(@"wakeup");
//        sleep(3);
    });
    
    dispatch_source_set_cancel_handler(_timer, ^{
        NSLog(@"canceled");
    });
    
    dispatch_resume(_timer);
}

- (void)stopTimer {
    dispatch_cancel(_timer);
}

#pragma mark -
#pragma mark -- After
//Time
dispatch_time_t dispatchTimeByDate(NSDate *date)
{
    NSTimeInterval interval = [date timeIntervalSince1970];
    double second;
    double subsecond = modf(interval, &second);
    
    struct timespec time;
    time.tv_sec = second;
    time.tv_nsec = subsecond * NSEC_PER_SEC;
    
    dispatch_time_t milestone = dispatch_walltime(&time, 0);
    
    return milestone;
}

//After
- (void)after {
    
    dispatch_time_t time;
    
    time = dispatch_time(DISPATCH_TIME_FOREVER, 0);//永远不执行
    time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_MSEC));//从现在开始3毫秒后
    time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_USEC));//从现在开始3微秒后
    time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC));//从现在开始3秒后
    
    dispatch_after(time, dispatch_get_main_queue(), ^{
        NSLog(@"after done");
    });
    
    //指定时间
    dispatch_time_t dateTime = dispatchTimeByDate([NSDate dateWithTimeIntervalSinceNow:3]);
    dispatch_after(dateTime, dispatch_get_main_queue(), ^{
        NSLog(@"date time after");
    });
}

@end
