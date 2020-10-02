//
//  OCGCDGroupController.m
//  Programming
//
//  Created by Peace on 9/30/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCGCDGroupController.h"

@interface OCGCDGroupController ()

@end

@implementation OCGCDGroupController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"Group:"];
    [self.model appendDarkItemTitle:@"dispatch_group_async()" target:self selector:@selector(group_async)];
    [self.model appendDarkItemTitle:@"dispatch_group_enter/leave()" target:self selector:@selector(groupEnterLeave)];
    [self.model appendDarkItemTitle:@"dispatch_group_wait()" target:self selector:@selector(groupWait)];
}

- (void)group_async {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_group_async(group, queue, ^{
        NSLog(@"1");
        sleep(1);
        NSLog(@"1.1");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"2");
        sleep(1);
        NSLog(@"2.1");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"3");
        sleep(1);
        NSLog(@"3.1");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"4");
        sleep(1);
        NSLog(@"4.1");
    });
    dispatch_group_notify(group, queue, ^{
        NSLog(@"done");
    });
}

- (dispatch_group_t)groupEnterLeave {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_group_enter(group);
    dispatch_group_enter(group);
    dispatch_group_enter(group);
    dispatch_group_enter(group);
    
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"1");
        dispatch_group_leave(group);
    });
    
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"2");
        dispatch_group_leave(group);
    });
    
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"3");
        dispatch_group_leave(group);
    });
    
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"4");
        dispatch_group_leave(group);
    });
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"notify");
    });
    
    return group;
}

- (void)groupWait {
    dispatch_group_t group = [self groupEnterLeave];
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"after wait!");
}

@end
