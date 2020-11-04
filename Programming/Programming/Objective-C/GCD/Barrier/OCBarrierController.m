//
//  OCBarrierController.m
//  Programming
//
//  Created by Peace on 11/4/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCBarrierController.h"

@interface OCBarrierController ()
{
    dispatch_queue_t _queue;
    __block int _index;
}
@end

@implementation OCBarrierController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _queue = dispatch_queue_create("xxxx", DISPATCH_QUEUE_CONCURRENT);
    
    [self.model appendOpenedHeader:@"Barrier:"];
    [self.model appendDarkItemTitle:@"- read -" target:self selector:@selector(read)];
    [self.model appendDarkItemTitle:@"- write -" target:self selector:@selector(write)];
}

- (void)read {
    dispatch_async(_queue, ^{
        sleep(1);
        self->_index += 1;
        NSLog(@"%s %d",__func__,self->_index);
    });
}

- (void)write {
    dispatch_barrier_async(_queue, ^{
        sleep(1);
        self->_index += 1;
        NSLog(@"%s %d",__func__,self->_index);
    });
}

@end
