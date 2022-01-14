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

#import "OCARCObject.h"

@interface OCMemoryController ()

@end

@implementation OCMemoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"内存大小(总数/已用/剩余)"];
    [self.model appendDarkItemWithTitle:@"info" class:[OCMemoryInfoController class]];
    
    [self.model appendOpenedHeader:@"malloc(开辟内存空间)"];
    [self.model appendDarkItemTitle:@"malloc" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"copy/mutableCopy" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"new" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"duoble/float/int/long int/char" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"int/NString" target:self selector:@selector(compareIntAndString)];
    [self.model appendItemTitle:@"Tagged Pointer" target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"type modifier(修饰变量)"];
    [self.model appendDarkItemWithTitle:@"__weak info" class:[OCMWeakController class]];
    [self.model appendDarkItemTitle:@"__weak" target:self selector:@selector(__weakAction)];
    [self.model appendDarkItemTitle:@"__unsafe_unretained" target:self selector:@selector(__unsafe__unretainAction)];
    [self.model appendDarkItemTitle:@"default strong" target:self selector:@selector(defaultAction)];
    [self.model appendDarkItemTitle:@"__strong" target:self selector:@selector(__strongAction)];
    [self.model appendDarkItemTitle:@"__autoreleasing" target:self selector:@selector(__autoreleasingAction)];
    [self.model appendDarkItemTitle:@"__autoreleasing use" target:self selector:@selector(__autoreleasingUseAction)];
    [self.model appendItemTitle:@"__bridge_retained" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"__bridge_transfer" target:self selector:@selector(todo)];
    
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

- (void)__unsafe__unretainAction {
    __unsafe_unretained OCARCObject *obj = nil;
    {
        OCARCObject *obj1 = [OCARCObject new];
        NSLog(@"obj1 = %@, %@",obj1,[obj1 valueForKey:@"retainCount"]);
        obj = obj1;
        NSLog(@"obj1 = %@, %@",obj1,[obj1 valueForKey:@"retainCount"]);
        [obj1 test];
    }
    
    NSLog(@"obj1 = %@, %@",obj,[obj valueForKey:@"retainCount"]);
    [obj test];
}

- (void)__weakAction {
    __weak OCARCObject *obj = nil;
    {
        OCARCObject *obj1 = [OCARCObject new];
        NSLog(@"obj1 = %@, %@",obj1,[obj1 valueForKey:@"retainCount"]);
        obj = obj1;
        NSLog(@"obj1 = %@, %@",obj1,[obj1 valueForKey:@"retainCount"]);
        [obj1 test];
    }
    
    NSLog(@"obj1 = %@, %@",obj,[obj valueForKey:@"retainCount"]);
    [obj test];
}

- (void)defaultAction {
    OCARCObject *obj = nil;
    {
        OCARCObject *obj1 = [OCARCObject new];
        NSLog(@"obj1 = %@, %@",obj1,[obj1 valueForKey:@"retainCount"]);
        obj = obj1;
        NSLog(@"obj1 = %@, %@",obj1,[obj1 valueForKey:@"retainCount"]);
        [obj1 test];
    }
    
    NSLog(@"obj1 = %@, %@",obj,[obj valueForKey:@"retainCount"]);
    [obj test];
}

- (void)__strongAction {
    __strong OCARCObject *obj = nil;
    {
        OCARCObject *obj1 = [OCARCObject new];
        NSLog(@"obj1 = %@, %@",obj1,[obj1 valueForKey:@"retainCount"]);
        obj = obj1;
        NSLog(@"obj1 = %@, %@",obj1,[obj1 valueForKey:@"retainCount"]);
        [obj1 test];
    }
    
    NSLog(@"obj1 = %@, %@",obj,[obj valueForKey:@"retainCount"]);
    [obj test];
}

- (void)__autoreleasingAction {
    @autoreleasepool {
        __autoreleasing OCARCObject *obj = nil;
        {
            OCARCObject *obj1 = [OCARCObject new];
            NSLog(@"obj1 = %@, %@",obj1,[obj1 valueForKey:@"retainCount"]);
            obj = obj1;
            NSLog(@"obj1 = %@, %@",obj1,[obj1 valueForKey:@"retainCount"]);
            [obj1 test];
        }
        
        NSLog(@"obj1 = %@, %@",obj,[obj valueForKey:@"retainCount"]);
        [obj test];
    }
    NSLog(@"------------------------");
    
    __autoreleasing OCARCObject *obj = nil;
    {
        OCARCObject *obj1 = [OCARCObject new];
        NSLog(@"obj1 = %@, %@",obj1,[obj1 valueForKey:@"retainCount"]);
        obj = obj1;
        NSLog(@"obj1 = %@, %@",obj1,[obj1 valueForKey:@"retainCount"]);
        [obj1 test];
    }
    
    NSLog(@"obj1 = %@, %@",obj,[obj valueForKey:@"retainCount"]);
    [obj test];
    NSLog(@"------------------------");
}

- (void)__autoreleasingUseAction {
    // autoreleasingpool
    @autoreleasepool {
        NSMutableArray *mutableArray = [NSMutableArray array];
        for (int i=0; i<10; i++) {
            OCARCObject *obj1 = [OCARCObject new];
            obj1.tag = i;
            [mutableArray addObject:obj1];
        }
        NSLog(@"1------------------------");
    }
    NSLog(@"2------------------------");
    
    // 非autoreleasingpool
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (int i=0; i<10; i++) {
        OCARCObject *obj1 = [OCARCObject new];
        obj1.tag = i;
        [mutableArray addObject:obj1];
    }
    NSLog(@"a------------------------");
}

@end
