//
//  OCMessageController.m
//  Programming
//
//  Created by wangheping on 2021/3/8.
//  Copyright © 2021 Peace. All rights reserved.
//

#import "OCMessageController.h"

#import "OCMNotificationController.h"
#import "OCMDelegateController.h"
#import "OCMTargetActionController.h"
#import "OCMBlockController.h"
#import "OCMkvoController.h"

@interface OCMessageController ()

@end

@implementation OCMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.model appendOpenedHeader:@"Message"];
    [self.model appendDarkItemWithTitle:@"NSNotificationCenter" class:[OCMNotificationController class]];
    [self.model appendDarkItemWithTitle:@"Delegate" class:[OCMDelegateController class]];
    [self.model appendDarkItemWithTitle:@"Target / Action" class:[OCMTargetActionController class]];
    [self.model appendDarkItemWithTitle:@"Block" class:[OCMBlockController class]];
    [self.model appendDarkItemWithTitle:@"KVO" class:[OCMkvoController class]];
    [self.model appendItemWithTitle:@"objc_msgSend" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Message Forwarding (消息转发)" class:[UIViewController class]];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
