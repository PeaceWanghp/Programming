//
//  ALGQueueController+Array.m
//  Programming
//
//  Created by Peace on 7/31/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ALGQueueController+Array.h"

#import <objc/runtime.h>

@implementation ArrayQueue
- (instancetype)initWithSize:(int)max {
    self = [super init];
    if (self) {
        _size = max + 1;
        _head = 0;
        _tail = 0;
    }
    return self;
}

- (void)come:(int)value {
    if ([self isFull]) {
        NSLog(@"queue is full");
    }
    else {
        _array[_tail] = value;
        _tail = (_tail + 1) % _size;
        
        NSLog(@"come %d",value);
        [self output];
    }
}

- (int)leave {
    if ([self isEmpty]) {
        NSLog(@"queue is empty");
        return 0;
    }
    else {
        int value = _array[_head];
        _array[_head] = 0;
        _head = (_head + 1) % _size;
        
        NSLog(@"leave %d",value);
        [self output];
        
        return value;
    }
}

- (BOOL)isFull {
    
    return (_tail + 1) % _size == _head;
}

- (BOOL)isEmpty {
    return _head == _tail;
}

- (int)lenth {
    return (_tail + _size - _head) % _size;
}

- (void)output {
    NSMutableString *string = [NSMutableString string];
    for (int i = 0; i<_size; ++i) {
        [string appendFormat:@"%d",_array[i]];
    }
    NSLog(@"---%@",string);
}

@end


@implementation ALGQueueController (Array)


static char arrayQueueKey;

- (id)arrayQueue {
  id object = objc_getAssociatedObject(self,&arrayQueueKey);
  return object;
}

- (void)setArrayQueue:(ArrayQueue *)arrayQueue {
    [self willChangeValueForKey:@"arrayQueueKey"];
    objc_setAssociatedObject(self, &arrayQueueKey, arrayQueue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"arrayQueueKey"];
}

- (void)testArrayQueueCome {
    if (!self.arrayQueue) {
        self.arrayQueue = [[ArrayQueue alloc] initWithSize:5];
    }
    [self.arrayQueue come:1];
}

- (void)testArrayQueueLeave {
    [self.arrayQueue leave];
}


@end
