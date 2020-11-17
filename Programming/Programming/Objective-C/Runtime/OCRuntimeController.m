//
//  OCRuntimeController.m
//  Programming
//
//  Created by Peace on 7/17/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCRuntimeController.h"

#import <objc/runtime.h>

#import "OCRuntimeTestObject.h"

#import "OCMessagePassingController.h"
#import "OCCategoryController.h"
#import "OCMessageForwardingController.h"
#import "OCSwizzleController.h"
#import "OCAddPropertyController.h"
#import "OCAddMethodController.h"

#import "OCJSPatchController.h"
#import "OCKVCController.h"
#import "OCKVOController.h"

@interface OCRuntimeController ()

@end

@implementation OCRuntimeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"原理："];
    [self.model appendDarkItemTitle:@"Source Code(源码阅读)" target:self selector:@selector(getIsa)];
    [self.model appendDarkItemTitle:@"isa" target:self selector:@selector(getIsa)];
    [self.model appendDarkItemTitle:@"struct class" target:self selector:@selector(getIsa)];
    [self.model appendDarkItemTitle:@"ivar (属性列表)" target:self selector:@selector(getIsa)];
    [self.model appendDarkItemWithTitle:@"Message Passing(消息传递机制)" class:[OCMessagePassingController class]];
    
    [self.model appendOpenedHeader:@"Example/应用实例："];
    [self.model appendDarkItemWithTitle:@"addProperty (添加属性)" class:[OCAddPropertyController class]];
    [self.model appendItemWithTitle:@"addMethod (添加方法)" class:[OCAddMethodController class]];
    [self.model appendDarkItemWithTitle:@"Swizzle" class:[OCSwizzleController class]];
    [self.model appendDarkItemWithTitle:@"Category" class:[OCCategoryController class]];
    [self.model appendItemWithTitle:@"KVC (Key-Value Coding)" class:[OCKVCController class]];
    [self.model appendItemWithTitle:@"KVO (Key-Value Observer)" class:[OCKVOController class]];
    [self.model appendItemWithTitle:@"NSCoding (自动归档、解档)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"JSPatch" class:[OCJSPatchController class]];
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
