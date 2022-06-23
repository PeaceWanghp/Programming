//
//  OCPointerController.m
//  Programming
//
//  Created by Peace on 7/8/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCPointerController.h"

#import "OCPTestObject.h"

@interface OCPointerController ()
@property (nonatomic,strong) OCPTestObject *object;
@end

@implementation OCPointerController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self.model appendDarkItemTitle:@"NSString * string = @\"aaa\";\n"
                                     "NSLog(@\"%p\", &string);  //指针地址\n"
                                     "NSLog(@\"%p\", string);    //指针值地址\n"
                                     "NSLog(@\"%@\", string);   //指针值"
                             target:self selector:@selector(todo)];
    
    [self.model appendDarkItemTitle:@"int (p:指针地址, *p:指针值, &p:指针值地址)"
                             target:self selector:@selector(pointerInt)];
    [self.model appendDarkItemTitle:@"NSString (%@--p:值, %p--p:值地址, %p--&p:指针地址)"
                             target:self selector:@selector(pointerNSString)];
    
    [self.model appendDarkItemTitle:@"指针的指针(String)" target:self selector:@selector(pointerToPointer)];
    [self.model appendDarkItemTitle:@"指针的指针(自定义对象)" target:self selector:@selector(pointerToPointerObject)];
    [self.model appendDarkItemTitle:@"指针的指针(自定义对象1)" target:self selector:@selector(pointerToPointerObject1)];
    
}

#pragma mark -
- (void)pointerInt {
    int a = 10;
    int *p = &a;
    printf("p = %p, *p = %d, &p = %p \n", p, *p, &p);//指针地址、指针值、指针值地址
    printf("a = %d, &a = %p\n",a, &a);//变量值、变量地址
}

- (void)pointerNSString {
    NSString * string = @"aaa";
    NSLog(@"%p-->%p:%@", &string, string, string);//指针地址、指针值地址、指针值
    NSString * __strong * string2 = &string;
    NSLog(@"%p-->%p:%@", &string2, *string2, *string2);//指针地址、指针值地址、指针值
}

#pragma mark - 二级指针
- (void)pointerToPointer {
    NSString *string = @"zzzz";
    NSLog(@"1.object : %p---->%@", string,string);
    
    [self testTodo1:string];
    NSLog(@"2.object : %p---->%@", string,string);
    
    [self testTodo:&string];
    NSLog(@"3.object : %p---->%@", string,string);
}

- (void)testTodo1:(NSString *)string {
    string = @"aaaa";
}

// 指针的指针，可在子函数中修改主函数中指针值，可不需通过返回值方式
- (void)testTodo:(NSString **)string {
//    NSLog(@"2.object : %p", string);
//    NSLog(@"3.object : %p---->%@", *string,*string);
    *string = @"nnnnn";
//    [*string stringByAppendingString:@"aaa"];
//    [*string length];
//    NSLog(@"4.object : %p", string);
//    NSLog(@"5.*object : %p---->%@", *string,*string);
}

#pragma mark - 二级指针对象操作
- (void)pointerToPointerObject {
    OCPTestObject *object = [OCPTestObject new];
    self.object = object;
    [self getObject:&object];
    NSLog(@"");
}

- (void)pointerToPointerObject1 {
    OCPTestObject *object = [OCPTestObject new];
    [self getObject:&object];
    NSLog(@"");
}

- (void)getObject:(OCPTestObject **)object {
    OCPTestObject *obj1 = *object;
    obj1.intValue = 3;
    obj1.strValue = @"333";
}

@end
