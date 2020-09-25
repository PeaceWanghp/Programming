//
//  OCMWeakController.m
//  Programming
//
//  Created by Peace on 9/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCMWeakController.h"

#import "OCMWeakObject.h"

@interface OCMWeakController ()
@property (nonatomic,copy) void(^block)(void);
@end

@implementation OCMWeakController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"__weak底层实现:"];
    [self.model appendDarkItemTitle:@"__weak retainCount" target:self selector:@selector(testRetainCount)];
    [self.model appendDarkItemTitle:@"避免循环引用" target:self selector:@selector(testRetainCount2)];
    [self.model appendDarkItemTitle:@"__weak 弱引用实现方式" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"1.weak表其实是一个hash（哈希）表，Key是所指对象的地址，Value是weak指针的地址数组。\n"
                             target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"2.一个weak引用的处理涉及各种查表、添加与删除操作，还是有一定消耗的"
                             target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"3.只在避免循环引用的时候使用__weak修饰符" target:self selector:@selector(todo)];
    
    
}

- (void)testRetainCount {
    NSLog(@"--------------");
    
    __weak OCMWeakObject *weakObj = nil;
    __weak OCMWeakObject *weakObj1 = nil;
    
    OCMWeakObject *strongObj = nil;
    
    OCMWeakObject *object = [OCMWeakObject new];
    object.tag = 5;
    NSLog(@"%@",[object valueForKey:@"retainCount"]);
    NSLog(@"\n");
        
    weakObj = object;
    weakObj1 = object;
    NSLog(@"%@",[weakObj valueForKey:@"retainCount"]);
    NSLog(@"%@",[weakObj1 valueForKey:@"retainCount"]);
    NSLog(@"%@",[object valueForKey:@"retainCount"]);
    NSLog(@"\n");
        
    strongObj = object;
        
    NSLog(@"%@",[object valueForKey:@"retainCount"]);
    NSLog(@"%@",[weakObj valueForKey:@"retainCount"]);
    NSLog(@"%@",[weakObj1 valueForKey:@"retainCount"]);
    NSLog(@"%@",[strongObj valueForKey:@"retainCount"]);
    NSLog(@"\n");
    
    NSArray *array = [NSArray arrayWithObjects:object, nil];
    
    NSLog(@"%@",[object valueForKey:@"retainCount"]);
    NSLog(@"%@",[weakObj valueForKey:@"retainCount"]);
    NSLog(@"%@",[weakObj1 valueForKey:@"retainCount"]);
    NSLog(@"%@",[strongObj valueForKey:@"retainCount"]);
    NSLog(@"\n");
    
    NSLog(@"+++++++++++++");
}

//若引用后再强引用
- (void)testRetainCount2 {
    OCMWeakObject *object = [OCMWeakObject new];
    NSLog(@"%@",[object valueForKey:@"retainCount"]);
    __weak OCMWeakObject *weakObj = object;
    self.block = ^ {
        NSLog(@"---%@",[weakObj valueForKey:@"retainCount"]);
    };
    NSLog(@"%@",[object valueForKey:@"retainCount"]);
    self.block();
    NSLog(@"%@",[object valueForKey:@"retainCount"]);
    
}

@end
