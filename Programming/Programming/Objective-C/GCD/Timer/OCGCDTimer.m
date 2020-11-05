//
//  OCGCDTimer.m
//  Programming
//
//  Created by Peace on 11/5/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCGCDTimer.h"

@interface OCGCDTimer ()
{
    dispatch_source_t _timer;
}

@end

@implementation OCGCDTimer

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

@end
