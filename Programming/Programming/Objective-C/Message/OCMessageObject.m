//
//  OCMessageObject.m
//  Programming
//
//  Created by wangheping on 2021/3/8.
//  Copyright © 2021 Peace. All rights reserved.
//

#import "OCMessageObject.h"

@implementation OCMessageObject

#pragma mark -
#pragma mark -- Life Cycle
- (instancetype)init {
    self = [super init];
    if (self) {
        //Notification
        [self addNotification];
        //Delegate
        
    }
    return self;
}

#pragma mark -
#pragma mark -- Notification
- (void)addNotification {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(mainPostAction)
                                                     name:@"MainThread"
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(subPostAction)
                                                     name:@"SubThread"
                                                   object:nil];
    });
}
- (void)mainPostAction {
    NSLog(@"MainThread:---------%d,%@",self.tag,[NSThread currentThread]);
}

- (void)subPostAction {
    NSLog(@"SubThread:---------%d,%@",self.tag,[NSThread currentThread]);
}

#pragma mark -
#pragma mark -- Delegate
- (void)delegateAction {
    [self.delegate testDelegateTag:2];
}

- (void)testEntrustTag:(int)tag {
    NSLog(@"Entrust:---------%d",tag);
}

@end
