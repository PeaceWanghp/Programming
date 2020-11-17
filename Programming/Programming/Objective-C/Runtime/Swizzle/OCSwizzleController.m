//
//  OCSwizzleController.m
//  Programming
//
//  Created by Peace on 11/11/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCSwizzleController.h"
#import "OCSwizzleObject.h"
#import "OCSwizzleObject+One.h"
#import "OCSwizzleObject+Two.h"

@interface OCSwizzleController ()
{
    OCSwizzleObject *_swizzleObject;
}
@end

@implementation OCSwizzleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _swizzleObject = [OCSwizzleObject new];
    
    [self.model appendOpenedHeader:@"Swizzle:"];
    [self.model appendDarkItemTitle:@"exchangeImplementations"
                         target:self selector:@selector(exchangeAction)];
    [self.model appendDarkItemTitle:@"class_replaceMethod"
                         target:self selector:@selector(replaceAction)];
    [self.model appendDarkItemTitle:@"method_setImplementation"
                         target:self selector:@selector(setImplementationAction)];
    [self.model appendDarkItemTitle:@"三次swizzle一个方法会如何"
                         target:self selector:@selector(multiSwizzle)];
    
    [self.model appendOpenedHeader:@"应用场景:"];
    [self.model appendDarkItemWithTitle:@"1.数组越界判断/插入nil" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"2.字典插入nil" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"3.友盟统计，大规模控件打点" class:[UIViewController class]];
}

- (void)exchangeAction {
    [_swizzleObject exchangeMethod1];
    [_swizzleObject exchangeMethod2];
}

- (void)replaceAction {
    [_swizzleObject replaceMethod1];
    [_swizzleObject replaceMethod1];
}

- (void)setImplementationAction {
    [_swizzleObject testImplementation];
    [_swizzleObject testImplementation2];
}

- (void)multiSwizzle {
    [_swizzleObject testLog];
    [_swizzleObject testLog2];
    [_swizzleObject testLog3];
}

@end
