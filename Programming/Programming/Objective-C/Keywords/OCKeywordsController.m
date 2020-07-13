//
//  OCKeywordsController.m
//  Programming
//
//  Created by Peace on 7/8/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCKeywordsController.h"

#import "OCTestExtern.h"

static int height = 44;
static int width;

@interface OCKeywordsController ()
{
    
}
@end

@implementation OCKeywordsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"const (常量)"];
    [self.model appendDarkItemTitle:@"常量：\n0.const int i = 5;与int const i=5;效果一样。\n1.变量i具有只读特性，不能够被更改。\n2.若想对i重新赋值，如i = 10；则是错误的。\n3.定义变量的同时，必须初始化。" target:self selector:@selector(constInt)];
    [self.model appendDarkItemTitle:@"数组：\n数组元素与变量类似，具有只读属性，不能被更改；一旦更改，如程序将会报错。" target:self selector:@selector(constArray)];
    [self.model appendDarkItemTitle:@"指针一：\n一种是限定指向空间的值不能修改。" target:self selector:@selector(constPointer)];
    [self.model appendDarkItemTitle:@"指针二：\n一种是限定指针不能修改。" target:self selector:@selector(constPointer2)];
    
    [self.model appendOpenedHeader:@"static(静态的)"];
    [self.model appendDarkItemTitle:@"局部变量：\n1. 只会初始化一次\n2.在程序中只有一份内存\n3.不可以改变局部变量的作用域\n4.可延长局部变量的生命周期" target:self selector:@selector(staticTest)];
    [self.model appendDarkItemTitle:@"全局变量:\n作用域仅限于当前文件，外部类是不可以访问到该全局变量。\n" target:self selector:@selector(staticTest2)];
    
    [self.model appendOpenedHeader:@"extern(外部的)"];
    [self.model appendDarkItemTitle:@"对外公开内部定义的全局变量" target:self selector:@selector(testExtern)];
    
    [self.model appendOpenedHeader:@"#define(定义)"];
    [self.model appendDarkItemTitle:@"..." target:self selector:@selector(testDefine)];
}

#pragma mark -
#pragma mark -- static
- (void)staticTest {
    for (int i = 0; i < 10; i ++) {
        static int add = 0;
        add ++;
        
        int age = 0;
        age ++;
        
        NSLog(@"%d,%d",add,age);
    }
}

- (void)staticTest2 {
    NSLog(@"height = %d",height);
    height = 55;
    NSLog(@"height = %d",height);
    
    NSLog(@"width = %d",width);
    width = 320;
    NSLog(@"width = %d",width);
    width = 323;
    NSLog(@"width = %d",width);
}

#pragma mark -
#pragma mark -- Const
- (void)constInt {
    const int a = 1;
    
    int const b = 1;
    
    //修改 a,b 均为错误
    //    a = 2;
    //    b = 2;
}

- (void)constArray {
    const int array[5] = {1,2,3,4,5};
    
    // array[0] = array[0]+1; //错误
}

//限定指向的空间不能修改
- (void)constPointer {
    int i = 5;
    int k = 7;
    const int * p1 = &i; //定义1
    NSLog(@"%p:%d",p1,*p1);
//    *p1 = 20;
    p1 = &k;
    NSLog(@"%p:%d",p1,*p1);
}

//限定指针不能修改
- (void)constPointer2 {
    int j = 6;
    int * const p2 =&j; //定义
    NSLog(@"%p:%d",p2,*p2);
    *p2 = 20;
//    p2 = &j;
    NSLog(@"%p:%d",p2,*p2);
}

//指针指向空间与指针均不能修改
- (void)constTest {
    const int * const p1 = 11;
//    *p1 = 1;
    int const * const p2 = 12;
//    int i = 5;
//    p1 = &i;
    const NSString * const string1 = @"aaaaaaa"; // *p1：常量 p1：常量
    NSLog(@"string1 = %@",string1);
    
    NSString const * const string2 = @"cccccc";  // *p1：常量 p1：常量
    NSLog(@"string2 = %@",string2);
}

#pragma mark -
#pragma mark -- Extern
- (void)testExtern {
//    NSLog(@"%@",OCTString);
    NSLog(@"%@",OCTExternString);
}

#pragma mark -
#pragma mark -- #define
- (void)testDefine {
    
}

@end
