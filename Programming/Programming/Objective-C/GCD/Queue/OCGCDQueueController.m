//
//  OCGCDQueueController.m
//  Programming
//
//  Created by Peace on 9/23/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCGCDQueueController.h"

@interface OCGCDQueueController ()

@end

@implementation OCGCDQueueController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"queue:"];
    [self.model appendDarkItemTitle:@"DISPATCH_QUEUE_SERIAL NULL(串形队列)"
                             target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"DISPATCH_QUEUE_SERIAL_INACTIVE"
                             target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"DISPATCH_QUEUE_SERIAL_WITH_AUTORELEASE_POOL"
                             target:self selector:@selector(todo)];
    
    [self.model appendDarkItemTitle:@"DISPATCH_QUEUE_CONCURRENT(并行队列)"
                             target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"DISPATCH_QUEUE_CONCURRENT_INACTIVE"
                             target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"DISPATCH_QUEUE_CONCURRENT_WITH_AUTORELEASE_POOL"
                             target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"create:"];
    [self.model appendDarkItemTitle:@"dispatch_get_main_queue();//主队列"
                             target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"dispatch_get_global_queue(priority 优先权, 0);//全局并发队列"
                             target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"DISPATCH_QUEUE_PRIORITY_HIGH 2"
                             target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"DISPATCH_QUEUE_PRIORITY_DEFAULT 0"
                             target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"DISPATCH_QUEUE_PRIORITY_LOW (-2)"
                             target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN"
                             target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"dispatch_queue_create(name, serial/concurrent)"
                             target:self selector:@selector(todo)];
}

- (void)todo {
    
}

@end
