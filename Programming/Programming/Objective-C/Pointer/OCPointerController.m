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
 
    [self.model appendDarkItemTitle:@"指针值" target:self selector:@selector(testTodo)];
    [self.model appendDarkItemTitle:@"指针值地址" target:self selector:@selector(testTodo)];
    [self.model appendDarkItemTitle:@"指针地址" target:self selector:@selector(testTodo)];
    [self.model appendDarkItemTitle:@"指针的指针" target:self selector:@selector(testTodo)];
}

- (void)testTodo {
    NSString *string = @"aaa";
    NSLog(@"%p-->%p:%@",&string,string,string);//指针地址、值地址、值
    
    string = @"bbb";
    NSLog(@"%p-->%p:%@",&string,string,string);
    
    NSString *__strong* string1 = &string;
//    *string1 = ;
    NSLog(@"%p-->%p:%@",&string1,*string1,*string1);
    
    NSMutableString *mutableString = [NSMutableString stringWithString:@"aaa"];
    NSLog(@"%p-->%p:%@",&mutableString,mutableString,mutableString);
    
    [mutableString appendString:@"bbb"];
    NSLog(@"%p-->%p:%@",&mutableString,mutableString,mutableString);
}

- (void)todo {
    int i = 3;
        int k = 5;
        int *p = &i;
    //    NSLog(@"%p-->%p:%d",*p,p,p);
        NSLog(@"%d",&p);
        *p = 20;
    //    NSLog(@"%p-->%p:%d",*p,p,p);
        NSLog(@"%d",p);
        p = &k;
    //    NSLog(@"%p-->%p:%d",*p,p,p);
        NSLog(@"%d",p);
}

@end
