//
//  OCGCDAsync.h
//  Programming
//
//  Created by Peace on 7/6/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCGCDAsync : NSObject

- (void)serialQueue;
- (void)concurrentQueue;

- (void)starQueue;
- (void)suspend;
- (void)resume;

- (void)group;
- (void)groupEnterLeave;

- (void)barrier;

- (void)sycnDeadlock;
- (void)sycnDeadlockInSubthread;

@end

NS_ASSUME_NONNULL_END
