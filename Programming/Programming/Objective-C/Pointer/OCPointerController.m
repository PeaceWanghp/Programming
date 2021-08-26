//
//  OCPointerController.m
//  Programming
//
//  Created by Peace on 7/8/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCPointerController.h"

@interface OCPointerController ()

@end

@implementation OCPointerController

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
    
    [self.model appendDarkItemTitle:@"指针的指针" target:self selector:@selector(pointerToPointer)];
}

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

- (void)pointerToPointer {
    NSString *string = @"zzzz";
    NSLog(@"1.object : %p---->%@", string,string);
    [self testTodo:&string];
    NSLog(@"6.object : %p---->%@", string,string);
}

// 指针的指针，可在子函数中修改主函数中指针值，可不需通过返回值方式
- (void)testTodo:(NSString **)string {
    NSLog(@"2.object : %p", string);
    NSLog(@"3.object : %p---->%@", *string,*string);
    *string = @"nnnnn";
    NSLog(@"4.object : %p", string);
    NSLog(@"5.*object : %p---->%@", *string,*string);
}

@end
