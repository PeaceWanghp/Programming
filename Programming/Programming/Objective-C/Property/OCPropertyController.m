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
    [self.model appendItemTitle:@"asign" target:self selector:@selector(todo)];
    
    [self.model appendItemTitle:@"getter=isUserInteractionEnabled(修改默认生成的方法名)" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"setter=isUserInteractionEnabled(修改默认生成的方法名)" target:self selector:@selector(todo)];
    
    [self.model appendItemTitle:@"null_unspecified(默认：未指定)" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"nullable(可为空)" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"nonnull(不能为空)" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"null_resettable(就是调用setter去reset属性时，可以传入nil，但是getter返回值，不为空。UIView下面的tintColor，就是null_resettable。这样就保证，即使赋值为nil，也会返回一个非空的值。\n)" target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"@synthesize(自动合成)"];
    [self.model appendItemTitle:@"..." target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"@dynamic(非自动合成)"];
    [self.model appendItemTitle:@"..." target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"Apply:"];
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

@end
