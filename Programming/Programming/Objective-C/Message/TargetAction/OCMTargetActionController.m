//
//  OCMTargetActionController.m
//  Programming
//
//  Created by wangheping on 2021/3/8.
//  Copyright © 2021 Peace. All rights reserved.
//

#import "OCMTargetActionController.h"

#import "OCMessageObject.h"

@interface OCMTargetActionController ()
{
    OCMessageObject *_messageObject;
}
@end

@implementation OCMTargetActionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendDarkItemTitle:@"Doit" target:self selector:@selector(testAction)];
}

- (void)testAction {
    NSLog(@"1");
    _messageObject = [OCMessageObject new];
    _messageObject.target = self;
    _messageObject.action = @selector(taAction);
    [_messageObject taAction];
    NSLog(@"3");
}

- (void)taAction {
    NSLog(@"2");
}

@end
