//
//  OCBlockWeakStrongObject.m
//  Programming
//
//  Created by wangheping on 2021/2/18.
//  Copyright © 2021 Peace. All rights reserved.
//

#import "OCBlockWeakStrongObject.h"

@interface OCBlockWeakStrongObject ()
@property (nonatomic,copy) void(^block)(void);
@end

@implementation OCBlockWeakStrongObject

- (void)dealloc {
    NSLog(@"%s",__func__);
}

#pragma mark -
#pragma mark -- Trigger Life Cycle
- (void)selfBlock {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"self = %@",self);
        sleep(5);
        NSLog(@"self = %@",self);
    });
}

- (void)weakSelfBlock {
    __weak typeof(self) weakSelf = self;
    self.block = ^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"weakSelf = %@",weakSelf);
            sleep(5);
            NSLog(@"weakSelf = %@",weakSelf);
        });
    };
    self.block();
}

- (void)weakStrongSelfBlock {
    __weak typeof(self) weakSelf = self;
    self.block = ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"weakSelf = %@",strongSelf);
            sleep(5);
            NSLog(@"weakSelf = %@",strongSelf);
        });
    };
    self.block();
}


@end
