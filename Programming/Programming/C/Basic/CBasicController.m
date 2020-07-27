//
//  CBasicController.m
//  Programming
//
//  Created by Peace on 7/26/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "CBasicController.h"

#include "CTypeInteger.h"
#include "CPointer.h"

@interface CBasicController ()

@end

@implementation CBasicController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"Integer (整形型)"];
    [self.model appendDarkItemTitle:@"integer" target:self selector:@selector(integerTest)];
    
    [self.model appendOpenedHeader:@"Float (浮点型/实型——单精度、双精度)"];
    
    [self.model appendOpenedHeader:@"Char (字符型)"];
    [self.model appendDarkItemTitle:@"char" target:self selector:@selector(charTest)];
    
    [self.model appendOpenedHeader:@"Array (数组)"];
    [self.model appendOpenedHeader:@"Struct (结构体)"];
    [self.model appendOpenedHeader:@" (共用体/联合体)"];
    [self.model appendOpenedHeader:@" (枚举型)"];
    
    [self.model appendOpenedHeader:@"Pointer (指针)"];
    [self.model appendDarkItemTitle:@"Int" target:self selector:@selector(pointerInt)];
    [self.model appendDarkItemTitle:@"Swap Int" target:self selector:@selector(swapInt)];
    [self.model appendDarkItemTitle:@"Array" target:self selector:@selector(pointerArray)];
    [self.model appendDarkItemTitle:@"Char" target:self selector:@selector(pointerArray)];
    [self.model appendDarkItemTitle:@"**p/***p (多级指针)" target:self selector:@selector(pointerArray)];

    [self.model appendOpenedHeader:@"NULL (空类型/无类型)"];
    [self.model appendOpenedHeader:@"(常量)"];
    [self.model appendOpenedHeader:@"(变量)"];
}

#pragma mark -
#pragma mark -- Integer
- (void)integerTest {
    integer();
}

#pragma mark -
#pragma mark -- Char
- (void)charTest {
    
}

#pragma mark -
#pragma mark -- Pointer
- (void)pointerInt {
    pointerInt();
}

- (void)swapInt {
    swapInt();
}

- (void)pointerArray {
    pointerArray();
}

@end
