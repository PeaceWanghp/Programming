//
//  OCMemoryController.m
//  Programming
//
//  Created by Peace on 8/14/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCMemoryController.h"

#import "OCRetainCountController.h"
#import "OCAutoreleaseController.h"

@interface OCMemoryController ()

@end

@implementation OCMemoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"原理："];
    [self.model appendDarkItemTitle:@"malloc" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"__strong/__weak/__autorelease" target:self selector:@selector(todo)];
    [self.model appendDarkItemWithTitle:@"autorelease" class:[OCAutoreleaseController class]];
    [self.model appendDarkItemWithTitle:@"RetainCount (引用计数计)" class:[OCRetainCountController class]];
}

- (void)todo {
    
}

@end
