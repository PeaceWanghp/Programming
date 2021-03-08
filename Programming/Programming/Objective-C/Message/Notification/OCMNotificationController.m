//
//  OCMNotificationController.m
//  Programming
//
//  Created by wangheping on 2021/3/8.
//  Copyright © 2021 Peace. All rights reserved.
//

#import "OCMNotificationController.h"

#import "OCMessageObject.h"

@interface OCMNotificationController ()
{
    OCMessageObject *_messageObject;
}
@end

@implementation OCMNotificationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"Notification"];
    [self.model appendDarkItemTitle:@"Main Thread Post" target:self selector:@selector(mainPost)];
    [self.model appendDarkItemTitle:@"Sub Thread Post" target:self selector:@selector(subPost)];
    
    _messageObject = [OCMessageObject new];
    [_messageObject addNotification];
}

- (void)mainPost {
    _messageObject.tag = 2;
    
    NSLog(@"MainThread:---------1");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MainThread" object:nil];
    NSLog(@"MainThread:---------3");
}

- (void)subPost {
    _messageObject.tag = 2;
    
    NSLog(@"SubThread:---------1");
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SubThread" object:nil];
    });
    NSLog(@"SubThread:---------3");
}



@end
