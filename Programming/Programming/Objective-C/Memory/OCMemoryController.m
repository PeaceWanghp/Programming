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
#import "OCMemoryInfoController.h"

#import <objc/runtime.h>
#import <malloc/malloc.h>

@interface OCMemoryController ()

@end

@implementation OCMemoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"统计"];
    [self.model appendDarkItemWithTitle:@"Info" class:[OCMemoryInfoController class]];
    
    [self.model appendOpenedHeader:@"malloc(开辟内存空间)"];
    [self.model appendDarkItemTitle:@"malloc" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"copy/mutableCopy" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"new" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"duoble/float/int/long int/char" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"int/NString" target:self selector:@selector(compareIntAndString)];
    [self.model appendItemTitle:@"Tagged Pointer" target:self selector:@selector(todo)];
    
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

- (void)compareIntAndString {
    NSObject *obj = [[NSObject alloc] init];
    NSLog(@"obj : %lu,%zu,%lu",sizeof(obj),class_getInstanceSize([NSObject class]),malloc_size((__bridge const void *)(obj)));
    
    NSString *string = @"21";
    int value = 1;
    NSInteger value1 = 1;
    BOOL isValue = YES;
    NSLog(@"value : %zu,%lu",class_getInstanceSize([NSString class]),malloc_size((__bridge const void *)string));
    NSLog(@"value : %lu,%lu,%lu,%lu",sizeof(string),sizeof(value),sizeof(value1),sizeof(isValue));
    
}

@end
