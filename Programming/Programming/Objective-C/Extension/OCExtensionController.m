//
//  OCExtensionController.m
//  Programming
//
//  Created by Peace on 7/9/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCExtensionController.h"

#import "UIView+Extension.h"
#import "OCTestExtension.h"
#import "OCTestExtension+Extension.h"

@interface OCExtensionController ()
{
    OCTestExtension *_testExtension;
}
@end

@implementation OCExtensionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _testExtension = [[OCTestExtension alloc] init];
    
    [self.model appendOpenedHeader:@"作用："];
    
    [self.model appendDarkItemTitle:@"0.[源码/非源码]可扩展私有方法" target:self selector:@selector(extensionPrivateMethod)];
    
    [self.model appendDarkItemTitle:@"1.[源码]可添加属性" target:self selector:@selector(appendProperty)];
    [self.model appendDarkItemTitle:@"-1.[非源码]添加属性,***Crash***" target:self selector:@selector(closedSourceAppendProperty)];
    
    [self.model appendDarkItemTitle:@"-2.[源码]添实例方法" target:self selector:@selector(instanceMethod)];
    [self.model appendDarkItemTitle:@"+2.[非源码]添加实例方法，***Crash***" target:self selector:@selector(closedSourceInstanceMethod)];
    
    [self.model appendDarkItemTitle:@"3.[源码]可添类方法" target:[OCExtensionController class] selector:@selector(classMethod)];
    [self.model appendDarkItemTitle:@"-3.[非源码]可添类方法,***Crash***" target:[OCExtensionController class] selector:@selector(closedSourceClassMethod)];
    
    [self.model appendOpenedHeader:@"注意："];
    [self.model appendDarkItemTitle:@"1.声明的方法如未实现会报编译错误，因为Extension是在编译阶段被添加到类中" target:self selector:@selector(todo)];
}

- (void)todo {
    
}

#pragma mark -
#pragma mark -- Test Method
//【源码】添加属性
- (void)appendProperty {
    _testExtension.testValue = 11;
    NSLog(@"testName = %d", _testExtension.testValue);
}

//【非源码】添加属性
- (void)closedSourceAppendProperty {
    self.view.testValue = 10;
    NSLog(@"testName = %d", self.view.testValue);
}

//【源码】添加实例方法
- (void)instanceMethod {
    [_testExtension testMethod];
}

//【非源码】添加实例方法
- (void)closedSourceInstanceMethod {
    [self.view testMethod];
}

//【源码】添加类方法
+ (void)classMethod {
    [OCTestExtension testClassMethod];
}

//【非源码】添加类方法
+ (void)closedSourceClassMethod {
    [UIView testClassMethod];
}

//拓展分类方法
- (void)extensionPrivateMethod {
    NSLog(@"%f",[self.view x]);
    NSLog(@"%f",[self.view y]);
    NSLog(@"%f",[self.view width]);
    NSLog(@"%f",[self.view height]);
}

@end
