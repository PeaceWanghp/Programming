//
//  NSWeakTimer.m
//  Objective-C
//
//  Created by Peace on 11/22/19.
//  Copyright © 2019 peace. All rights reserved.
//

#import "NSWeakTimer.h"

@implementation NSWeakTimer

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    NSWeakTimer *weakTimer = [[NSWeakTimer alloc] init];
    weakTimer.target = aTarget;
    weakTimer.selector = aSelector;
    weakTimer.timer = [NSTimer scheduledTimerWithTimeInterval:ti target:weakTimer selector:@selector(timerSelector:) userInfo:userInfo repeats:yesOrNo];
    
    return weakTimer.timer;
}

- (void)timerSelector:(NSTimer *)tempTimer {
    if (self.target && [self.target respondsToSelector:self.selector]) {
        [self.target performSelector:self.selector withObject:tempTimer.userInfo];
    }
    else {
        [self.timer invalidate];
    }
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
