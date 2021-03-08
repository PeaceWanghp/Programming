//
//  OCMDelegateController.m
//  Programming
//
//  Created by wangheping on 2021/3/8.
//  Copyright © 2021 Peace. All rights reserved.
//

#import "OCMDelegateController.h"

#import "OCMessageObject.h"

@interface OCMDelegateController ()<OCMProtocol>
{
    OCMessageObject *_messageObject;
    id<OCMProtocol> _delegate;
}
@end

@implementation OCMDelegateController

#pragma mark -
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _messageObject = [OCMessageObject new];
    _messageObject.delegate = self;
    _delegate = _messageObject;
    
    [self.model appendDarkItemTitle:@"Delegate代理" target:self selector:@selector(delegateAction)];
    [self.model appendDarkItemTitle:@"Entrust委托" target:self selector:@selector(entrustAction)];
}

- (void)delegateAction {
    NSLog(@"Delegate:---------1");
    [_messageObject delegateAction];
    NSLog(@"Delegate:---------3");
}

- (void)entrustAction {
    NSLog(@"Entrust:---------1");
    [_delegate testEntrustTag:2];
    NSLog(@"Entrust:---------3");
}

#pragma mark -
#pragma mark -- Delegate
- (void)testDelegateTag:(int)tag {
    NSLog(@"Delegate:---------%d",tag);
}

@end
