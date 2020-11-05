//
//  OCMessagePassingController.m
//  Programming
//
//  Created by Peace on 11/5/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCMessagePassingController.h"
#import "OCMessageForwardingController.h"

@interface OCMessagePassingController ()

@end

@implementation OCMessagePassingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendItemTitle:@"msgsend()" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"缓存查找" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"实力方法列表查找" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"父类方法列表查找" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"动态解析" target:self selector:@selector(todo)];
    [self.model appendDarkItemWithTitle:@"MessageForwarding(消息转发)" class:[OCMessageForwardingController class]];
}

@end
