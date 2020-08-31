//
//  OCPropertyController.m
//  Programming
//
//  Created by Peace on 7/16/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCPropertyController.h"

#import "OCCopyController.h"
#import "OCPropertyObject.h"
#import "OCPNullObject.h"
#import "OCPSetterGetterObject.h"

@interface OCPropertyController ()

@end

@implementation OCPropertyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"@property"];
    
    [self.model appendItemTitle:@"class(不自动合成存取方法，需手动实现；不声明实例变量因为它是类变量)" target:self selector:@selector(todo)];
    
    [self.model appendItemTitle:@"atomic(原子性操作，线程安全【默认值】)" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"nonatomic(非原子性操作，线程不安全)" target:self selector:@selector(todo)];
    
    [self.model appendItemTitle:@"readonly" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"readwrite" target:self selector:@selector(todo)];
    
    [self.model appendDarkItemWithTitle:@"copy" class:[OCCopyController class]];
    [self.model appendItemTitle:@"strong(持有对象,ARC,默认值)" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"retain(持有对象,MRC)" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"unsafe_unretain (直接赋值,ARC)" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"weak(弱引用,ARC,release后置nil)" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"assign" target:self selector:@selector(todo)];
    
    [self.model appendDarkItemTitle:@"getter=isUserInteractionEnabled(修改默认生成的方法名)" target:self selector:@selector(testSetterGetter)];
    [self.model appendDarkItemTitle:@"setter=isUserInteractionEnabled(修改默认生成的方法名)" target:self selector:@selector(testSetterGetter)];
    
    [self.model appendDarkItemTitle:@"null_unspecified(默认：未指定)" target:self selector:@selector(testNull_unspecified)];
    [self.model appendDarkItemTitle:@"nullable(可为空)" target:self selector:@selector(testNullable)];
    [self.model appendDarkItemTitle:@"nonnull(不能为空)" target:self selector:@selector(testNonnull)];
    [self.model appendDarkItemTitle:@"null_resettable(就是调用setter传入nil，但是getter返回值不为空)" target:self selector:@selector(testNull_resettable)];
    
    [self.model appendOpenedHeader:@"@synthesize(自动合成)"];
    [self.model appendItemTitle:@"..." target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"@dynamic(非自动合成)"];
    [self.model appendItemTitle:@"..." target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"Apply(应用):"];
    [self.model appendItemTitle:@"getter (atomic/nonatomic)" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"setter (atomic/nonatomic)" target:self selector:@selector(todo)];
}

- (void)todo {
    OCPropertyObject *object = [OCPropertyObject new];
    NSLog(@"1.%@",[object valueForKey:@"retainCount"]);
    __weak typeof(object) weakObject = object;
    NSLog(@"2.%@",[object valueForKey:@"retainCount"]);
    NSLog(@"2.%@",[weakObject valueForKey:@"retainCount"]);
    OCPropertyObject *tmpObject = weakObject;
    NSLog(@"3.%@",[tmpObject valueForKey:@"retainCount"]);
    NSLog(@"3.%@",[weakObject valueForKey:@"retainCount"]);
    NSLog(@"3.%@",[object valueForKey:@"retainCount"]);
    object = nil;
    NSLog(@"4.%@",[tmpObject valueForKey:@"retainCount"]);
    NSLog(@"4.%@",[weakObject valueForKey:@"retainCount"]);
    NSLog(@"4.%@",[object valueForKey:@"retainCount"]);
    
}

- (void)todo1 {
    OCPropertyObject *object = [OCPropertyObject new];
    NSLog(@"1.%@",[object valueForKey:@"retainCount"]);
    __weak typeof(object) weakObject = object;
    NSLog(@"2.%@",[object valueForKey:@"retainCount"]);
    NSLog(@"2.%@",[weakObject valueForKey:@"retainCount"]);
    object = nil;
    NSLog(@"4.%@",[weakObject valueForKey:@"retainCount"]);
    NSLog(@"4.%@",[object valueForKey:@"retainCount"]);
}

#pragma mark -
#pragma mark -- Setter/Getter
- (void)testSetterGetter {
    OCPSetterGetterObject *object = [OCPSetterGetterObject new];
    object.name = @"1111";
    NSLog(@"name = %@",object.name);
    
    object.age = 3;
    NSLog(@"age = %d",object.age);
}

#pragma mark -
#pragma mark -- Null
- (void)testNull_unspecified {
    OCPNullObject *object = [OCPNullObject new];
    object.name = @"peace.wang";
    [object output];
    object.name = nil;
    [object output];
}

- (void)testNullable {
    OCPNullObject *object = [OCPNullObject new];
    object.name = @"peace.wang";
    [object output];
    object.firstName = @"peace";
    [object output];
    object.firstName = nil;
    [object output];
}

- (void)testNonnull {
    OCPNullObject *object = [OCPNullObject new];
    object.name = @"peace.wang";
    [object output];
    object.lastName = @"wang";
    [object output];
    object.lastName = nil;
    [object output];
}

- (void)testNull_resettable {
    OCPNullObject *object = [OCPNullObject new];
    object.name = @"peace.wang";
    [object output];
    object.nikeName = @"xiao ping zi";
    [object output];
    object.nikeName = nil;
    [object output];
}

@end
