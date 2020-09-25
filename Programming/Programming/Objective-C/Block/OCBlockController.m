//
//  OCBlockController.m
//  Programming
//
//  Created by Peace on 7/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCBlockController.h"

@interface OCBlockController ()

@end

@implementation OCBlockController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"测试"];
    [self.model appendDarkItemTitle:@"ARC Strong一个statckBlock" target:self selector:@selector(testBlock)];
    [self.model appendDarkItemTitle:@"mrc Strong一个statckBlock" target:self selector:@selector(globalAction)];
    
    [self.model appendOpenedHeader:@"概述："];
    [self.model appendDarkItemTitle:@"SourceCode(源码)" target:self selector:@selector(globalAction)];
    [self.model appendDarkItemTitle:@"被strong的block:使用了堆区数据则为mallocBlock,未使用则globalBlock" target:self selector:nil];
    [self.model appendDarkItemTitle:@"未被strong的block:使用了堆区数据则为stackBlock,未使用则globalBlock" target:self selector:nil];
    
    [self.model appendOpenedHeader:@"!__block"];
    [self.model appendDarkItemTitle:@"self" target:self selector:@selector(testSelf)];
    [self.model appendDarkItemTitle:@"int" target:self selector:@selector(testInt)];
    [self.model appendDarkItemTitle:@"NSObject" target:self selector:@selector(testObject)];
    
    [self.model appendOpenedHeader:@"__block"];
    [self.model appendDarkItemTitle:@"int" target:self selector:@selector(test__BlockInt)];
    [self.model appendDarkItemTitle:@"NSObject" target:self selector:@selector(test__BlockObject)];
    
    [self.model appendOpenedHeader:@"Weak/Strong"];
    [self.model appendDarkItemTitle:@"strong" target:self selector:@selector(testStrong)];
    [self.model appendDarkItemTitle:@"weak" target:self selector:@selector(testWeak)];
    [self.model appendDarkItemTitle:@"weak/strong" target:self selector:@selector(testWeakStrong)];
    
    [self.model appendOpenedHeader:@"Global(全局block)"];
    [self.model appendDarkItemTitle:@"Action" target:self selector:@selector(globalAction)];
    
    [self.model appendOpenedHeader:@"LocalBlock(局部block)"];
    [self.model appendDarkItemTitle:@"Method" target:self selector:@selector(localBlock)];
    [self.model appendDarkItemTitle:@"Class" target:self selector:@selector(classBlock)];
    
    [self.model appendOpenedHeader:@"PropertyBlock(属性block)"];
    [self.model appendDarkItemTitle:@"WeakBlock" target:self selector:@selector(weakBlockAction)];
    [self.model appendDarkItemTitle:@"StrongBlock" target:self selector:@selector(strongBlockAction)];
    [self.model appendDarkItemTitle:@"CopyBlock" target:self selector:@selector(copyBlockAction)];
    
    [self.model appendOpenedHeader:@"Method Argument(方法参数)"];
    [self.model appendDarkItemTitle:@"Action" target:self selector:@selector(argumentAction)];
    [self.model appendDarkItemTitle:@"Copy Action" target:self selector:@selector(copyArgumentAction)];
    
    [self.model appendOpenedHeader:@"Method Return(方法返回值)"];
    [self.model appendDarkItemTitle:@"Action" target:self selector:@selector(returnValueAction)];
}

- (void)testBlock {
    int age = 1;
    void (^block1)(void) = ^{
        NSLog(@"block1");
    };

    void (^block2)(void) = ^{
        NSLog(@"block2:%d",age);
    };

    NSLog(@"%@/%@/%@",[block1 class],[block2 class],[^{
        NSLog(@"block3:%d",age);
    } class]);
}

@end
