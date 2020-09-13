//
//  COperatorController.m
//  Programming
//
//  Created by Peace on 9/13/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "COperatorController.h"

@interface COperatorController ()

@end

@implementation COperatorController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"算数运算符:"];
    [self.model appendDarkItemWithTitle:@"+ (加)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"- (减)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"* (乘)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"/ (除)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"% (取模)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"++ (自增)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"-- (自减)" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"关系运算符:"];
    [self.model appendDarkItemWithTitle:@"== (等于)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"!= (不等于)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"> (大于)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"< (小于)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@">= (大于等于)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"<= (小于等于)" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"逻辑运算符:"];
    [self.model appendDarkItemWithTitle:@"&& (逻辑与)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"|| (逻辑或)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"! (逻辑非)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"?: (条件运算符/逻辑三元运算符)" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"按位运算符:"];
    [self.model appendDarkItemWithTitle:@"& (按位与)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"| (按位或)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"^ (按位异或)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"~ (按位取反)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"<< (按位左移)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@">> (按位右移)" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"数据运算符:"];
    [self.model appendDarkItemWithTitle:@"sizeof() (获取...的大小)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"[] (数组下标)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"& (...的地址)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"* (...的值)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"-> (结构体解引用)" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@". (结构体引用)" class:[UIViewController class]];
}

@end
