//
//  OCGCDApplyController.m
//  Programming
//
//  Created by Peace on 11/5/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCGCDApplyController.h"

@interface OCGCDApplyController ()

@end

@implementation OCGCDApplyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)dispatchApply {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_apply(10, queue, ^(size_t index) {
        NSLog(@"%zu",index);
    });
    NSLog(@"done");
}

- (void)dispatchApply1 {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        dispatch_apply(10, queue, ^(size_t index) {
            NSLog(@"%zu",index);
        });
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"done");
        });
    });
}

@end
