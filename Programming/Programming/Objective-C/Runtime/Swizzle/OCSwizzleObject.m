//
//  OCSwizzleObject.m
//  Programming
//
//  Created by Peace on 11/17/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCSwizzleObject.h"

#import <objc/runtime.h>

@implementation OCSwizzleObject

+ (void)initialize {
    //Exchange Implementation
    [self exchangeImplementation];
    
    //Replace Method
    [self replaceMethod];
    
    //Set Implementation
    [self setImplementation];
}

#pragma mark -
#pragma mark -- Exchange Implementation
+ (void)exchangeImplementation {
    SEL orginSEL = @selector(exchangeMethod1);
    SEL overrideSEL = @selector(exchangeMethod2);
    
    Method originMethod = class_getInstanceMethod([self class], orginSEL);
    Method overrideMethod = class_getInstanceMethod([self class], overrideSEL);
    
    method_exchangeImplementations(originMethod, overrideMethod);
}

- (void)exchangeMethod1 {
    NSLog(@"%s",__func__);
}

- (void)exchangeMethod2 {
    NSLog(@"%s",__func__);
}

#pragma mark -
#pragma mark -- Replace Method
+ (void)replaceMethod {
    SEL orginSel = @selector(replaceMethod1);
    SEL overrideSel = @selector(replaceMethod2);
           
    Method originMethod = class_getInstanceMethod([self class], orginSel);

    
    class_replaceMethod([self class],overrideSel,
                                   method_getImplementation(originMethod),
                                   method_getTypeEncoding(originMethod));
}

- (void)replaceMethod1 {
    NSLog(@"%s",__func__);
}

- (void)replaceMethod2 {
    NSLog(@"%s",__func__);
}

#pragma mark -
#pragma mark -- Set Implementation
+ (void)setImplementation {
    SEL orginSel = @selector(testImplementation);
    Method originMethod = class_getInstanceMethod([self class], orginSel);
    
    SEL overSel = @selector(testImplementation2);
    Method overMethod = class_getInstanceMethod([self class], overSel);
    IMP overIMP = method_getImplementation(overMethod);
    
    method_setImplementation(originMethod,overIMP);
}

- (void)testImplementation {
    NSLog(@"111111111");
}

- (void)testImplementation2 {
    NSLog(@"222222222");
}

#pragma mark -
#pragma mark -- 多分类同时交换
- (void)testLog {
    NSLog(@"11111111111111");
}

+ (void)exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2
{
    method_exchangeImplementations(class_getInstanceMethod(self, method1),
                                   class_getInstanceMethod(self, method2));
}

@end
