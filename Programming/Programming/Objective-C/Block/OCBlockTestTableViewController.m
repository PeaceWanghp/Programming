//
//  OCBlockTestTableViewController.m
//  Programming
//
//  Created by wangheping on 2022/10/31.
//  Copyright © 2022 Peace. All rights reserved.
//

#import "OCBlockTestTableViewController.h"

@interface OCBlockTestTableViewController ()
@property (nonatomic, copy) void(^firstBlock)(void);
@property (nonatomic, strong) OCBlockFirstTestObject *firstObject;
@end

@implementation OCBlockTestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self.model appendDarkItemTitle:@"指针的指针，解循环引用" target:self selector:@selector(pointerBreakCycle)];
    [self.model appendDarkItemTitle:@"打破引用环，解循环引用" target:self selector:@selector(breakCycle)];
    
    [self.model appendDarkItemTitle:@"test 内存泄漏" target:self selector:@selector(action1)];
    [self.model appendDarkItemTitle:@"test weak不泄漏" target:self selector:@selector(action2)];
    
    
}

- (void)pointerBreakCycle {
    self.firstBlock = ^{
        
    };
    self.firstBlock();
}

- (void)breakCycle {
    
}

- (void)action1 {
    OCBlockFirstTestObject *testObject = [OCBlockFirstTestObject new];
    [testObject testMethod];
}

- (void)action2 {
    OCBlockFirstTestObject *testObject = [OCBlockFirstTestObject new];
    [testObject test2Method];
}

@end

@implementation OCBlockFirstTestObject

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

// 不泄漏
- (void)test2Method {
    __weak typeof(self) weakSelf = self;
    self.block1 = ^{
        weakSelf.value = 2;
    };
    self.block1();
}

// 内存泄漏
- (void)testMethod {
    self.value = 1;
    self.block1 = ^{
        self.value = 2;
    };
    self.block1();
}

@end
