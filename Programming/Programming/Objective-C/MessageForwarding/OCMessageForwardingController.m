//
//  OCMessageForwardingController.m
//  Programming
//
//  Created by Peace on 7/16/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCMessageForwardingController.h"

#import "OCMsgForwardingObject.h"
#import <objc/runtime.h>

@interface OCMessageForwardingController ()

@end

@implementation OCMessageForwardingController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self.model appendOpenedHeader:@"Resolve"];
    [self.model appendDarkItemTitle:@"YES" target:self selector:@selector(fristYes)];
    [self.model appendDarkItemTitle:@"NO (crash)" target:self selector:@selector(fristNO)];
    
    [self.model appendOpenedHeader:@"Forwarding"];
    [self.model appendDarkItemTitle:@"YES" target:self selector:@selector(forwardYes)];
    [self.model appendDarkItemTitle:@"NO (crash)" target:self selector:@selector(forwardNo)];
    
    [self.model appendOpenedHeader:@"MethodSignature"];
    [self.model appendDarkItemTitle:@"YES" target:self selector:@selector(methodSignatureYes)];
    [self.model appendDarkItemTitle:@"NO (crash)" target:self selector:@selector(methodSignatureNO)];
    
    [self.model appendOpenedHeader:@"实用案例："];
    [self.model appendDarkItemTitle:@"..." target:self selector:@selector(todo)];
}

#pragma mark -
#pragma mark -- Tools
- (void)todo {
    
}

#pragma mark -
#pragma mark -- 第一级: Resolve
- (void)fristYes {
    [self performSelector:@selector(todo:)];
}

- (void)fristNO {
    [self performSelector:@selector(fooxx)];
}

void fixedTodo(id obj, SEL _cmd) {
    NSLog(@"1111");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(todo:)) {
        class_addMethod([self class], sel, (IMP)fixedTodo, @"v@:");
        return YES;
    }
    
    return NO;
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    return NO;
}

#pragma mark -
#pragma mark -- 第二级: Forwarding
- (void)forwardYes {
    [self performSelector:@selector(foo)];
}

- (void)forwardNo {
    [self performSelector:@selector(fooNO)];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(foo)) {
        return [OCMsgForwardingObject new];
    }
    
    return nil;
}

#pragma mark -
#pragma mark -- 第三级: MethodSignature
- (void)methodSignatureYes {
    [self performSelector:@selector(methodName)];
}

- (void)methodSignatureNo {
    [self performSelector:@selector(methodNameNO)];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqualToString:@"methodName"]) {
        return [NSMethodSignature signatureWithObjCTypes:"xxx"];
    }
    
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    OCMsgForwardingObject *object = [OCMsgForwardingObject new];
    if ([object respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:object];
    }
    else {
        [self doesNotRecognizeSelector:anInvocation.selector];
    }
}

@end
