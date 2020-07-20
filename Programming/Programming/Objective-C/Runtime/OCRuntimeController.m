//
//  OCRuntimeController.m
//  Programming
//
//  Created by Peace on 7/17/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCRuntimeController.h"

#import "OCRuntimeTestObject.h"
#import <objc/runtime.h>

@interface OCRuntimeController ()

@end

@implementation OCRuntimeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"原理："];
    [self.model appendDarkItemTitle:@"isa" target:self selector:@selector(getIsa)];
    [self.model appendDarkItemTitle:@"struct class" target:self selector:@selector(getIsa)];
    [self.model appendDarkItemTitle:@"ivar (属性列表)" target:self selector:@selector(getIsa)];
    [self.model appendDarkItemTitle:@"SEL/IMP" target:self selector:@selector(getIsa)];
    
    [self.model appendOpenedHeader:@"实际应用："];
    [self.model appendItemWithTitle:@"exchangeImplementations (方法交换)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"addMethod (添加方法)" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"addProperty (添加属性) setAssociated/getAssociated" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"KVO" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"消息转发避免Crash" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"NSCoding (自动归档、解档)" class:[UIViewController class]];
}

- (void)getIsa {
    OCRuntimeTestObject *p = [[OCRuntimeTestObject alloc] init];
    
    NSLog(@"%@",[OCRuntimeTestObject class]);
    NSLog(@"%@",[p class]);
    NSLog(@"%@",object_getClass(p));
    NSLog(@"%@",object_getClass([OCRuntimeTestObject class]));
    NSLog(@"%@",objc_getMetaClass(object_getClassName(p)));
    
    NSLog(@"%d",class_isMetaClass(object_getClass(p)));
    NSLog(@"%d",class_isMetaClass(object_getClass([OCRuntimeTestObject class])));
    
    NSLog(@"%d",object_getClass(p)==object_getClass([OCRuntimeTestObject class]));
}

@end
