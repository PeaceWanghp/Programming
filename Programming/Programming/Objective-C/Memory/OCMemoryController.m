//
//  OCMemoryController.m
//  Programming
//
//  Created by Peace on 8/14/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCMemoryController.h"

#import "OCMWeakController.h"

#import "OCRetainCountController.h"
#import "OCAutoreleaseController.h"

@interface OCMemoryController ()

@end

@implementation OCMemoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"malloc(开辟内存空间)"];
    [self.model appendDarkItemTitle:@"malloc" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"copy/mutableCopy" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"new" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"duoble/float/int/long int/char" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"Tagged Pointer" target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"(持有/使用内存)"];
    [self.model appendDarkItemTitle:@"__strong/__autorelease/__unsafe_unretain" target:self selector:@selector(todo)];
    [self.model appendDarkItemWithTitle:@"__weak" class:[OCMWeakController class]];
    
    [self.model appendOpenedHeader:@"release(释放内存)"];
    [self.model appendDarkItemWithTitle:@"outInside(退出作用域)" class:[OCAutoreleaseController class]];
    [self.model appendDarkItemWithTitle:@"release" class:[OCAutoreleaseController class]];
    [self.model appendDarkItemWithTitle:@"nil" class:[OCAutoreleaseController class]];
    [self.model appendDarkItemWithTitle:@"autoreleasepool" class:[OCAutoreleaseController class]];
    
    [self.model appendOpenedHeader:@"retainCount(引用计数)"];
    [self.model appendDarkItemWithTitle:@"retainCount" class:[OCRetainCountController class]];
    [self.model appendDarkItemWithTitle:@"retainCount实现原理" class:[OCRetainCountController class]];
}

- (void)todo {
    
}

@end
