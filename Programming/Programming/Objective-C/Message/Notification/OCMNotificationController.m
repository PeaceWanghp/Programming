//
//  OCMNotificationController.m
//  Programming
//
//  Created by wangheping on 2021/3/8.
//  Copyright © 2021 Peace. All rights reserved.
//

#import "OCMNotificationController.h"

@interface OCMNotificationController ()

@end

@implementation OCMNotificationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"Notification"];
    [self.model appendDarkItemTitle:@"Main Thread Post" target:self selector:@selector(mainPost)];
    [self.model appendDarkItemTitle:@"Sub Thread Post" target:self selector:@selector(subPost)];
    
    [self addNotification];
}

#pragma mark -
#pragma mark -- Notification
- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mainPostAction) name:@"MainThread" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(subPostAction) name:@"SubThread" object:nil];
}

#pragma mark -
#pragma mark -- mainAction
- (void)mainPost {
    NSLog(@"MainThread:---------1");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MainThread" object:nil];
    NSLog(@"MainThread:---------3");
}

- (void)mainPostAction {
    NSLog(@"MainThread:---------2");
}

#pragma mark -
#pragma mark -- subAction
- (void)subPost {
    NSLog(@"SubThread:---------1");
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SubThread" object:nil];
    });
    NSLog(@"SubThread:---------3");
}

- (void)subPostAction {
    NSLog(@"SubThread:---------2");
}

@end
