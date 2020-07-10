//
//  OCLoadInitializeController.m
//  Programming
//
//  Created by Peace on 7/10/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCLoadInitializeController.h"

#import "OCLoadInitializeObject.h"
#import "OCLoadInitializeObject+Test.h"
#import "OCInheritB.h"

@interface OCLoadInitializeController ()

@end

@implementation OCLoadInitializeController

+ (void)load {
    NSLog(@"%s",__func__);
}

+ (void)initialize {
    NSLog(@"%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"Load"];
    [self.model appendDarkItemWithTitle:@"App启动即调用Load函数" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"Load在主线程中执行" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"Load在Categray中顺序"];
    [self.model appendDarkItemWithTitle:@"1.【Load执行顺序】原类中的Load优先Category" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"2.【Load执行顺序】多个Category Load都会执行,与Compile Sources顺序一致" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"3.【Load执行顺序】多个不同的类Load执行顺序与其在Compile Sources顺序一致" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"Load在继承类中顺序"];
    [self.model appendDarkItemWithTitle:@"父类的load优先于子类" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"Initialize"];
    [self.model appendDarkItemWithTitle:@"是线程安全的" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"在这个类接收第一条消息之前调用（无需初始化）" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"Categray:只调用最后一个Initialize" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"Inherit:按继承顺序依次调用" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"Test Initialize"];
    [self.model appendDarkItemTitle:@"继承顺序" target:self selector:@selector(testInheritInitialize)];
    [self.model appendDarkItemTitle:@"乱顺序" target:self selector:@selector(test2InheritInitialize)];
    
    [self.model appendOpenedHeader:@"作用："];
    [self.model appendDarkItemTitle:@"Runtime 方法交换Exchange/" target:self selector:@selector(todo)];
    
    OCLoadInitializeObject *object = [[OCLoadInitializeObject alloc] init];
    object.name = @"peace";
}

- (void)todo {
    
}

- (void)testInheritInitialize {
    dispatch_async(dispatch_queue_create("xxx", DISPATCH_QUEUE_CONCURRENT), ^{
        OCInheritB *inherit = [[OCInheritB alloc] init];
        inherit.name = @"wow";
    });
    
    dispatch_async(dispatch_queue_create("ooo", DISPATCH_QUEUE_CONCURRENT), ^{
        OCInheritB *inherit = [[OCInheritB alloc] init];
        [inherit testTodo];
    });
}

- (void)test2InheritInitialize {
    OCInheritA *inherit = [[OCInheritA alloc] init];
    inherit.name = @"wow";
}

@end
