//
//  OCMsgPassingController.m
//  Programming
//
//  Created by Peace on 8/20/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCMsgPassingController.h"

#import "OCMessageForwardingController.h"

@interface OCMsgPassingController ()

@end

@implementation OCMsgPassingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendItemWithTitle:@"send_msg()" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"动态解析" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"MessageForwarding(消息转发)" class:[OCMessageForwardingController class]];
}

@end
