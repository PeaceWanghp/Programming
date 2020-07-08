//
//  OCCategaryController.m
//  Programming
//
//  Created by Peace on 7/8/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCCategaryController.h"

@interface OCCategaryController ()

@end

@implementation OCCategaryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"作用："];
    [self.model appendDarkItemTitle:@"1.方便方法的归类" target:self selector:@selector(appendMethod)];
    [self.model appendDarkItemTitle:@"2.拓展无源码类" target:self selector:@selector(appendMethod)];
    [self.model appendDarkItemTitle:@"3.开放私有方法" target:self selector:@selector(publicPrivateMethod)];
    
    [self.model appendOpenedHeader:@"注意："];
    [self.model appendDarkItemTitle:@"1.添加属性不自动实现，需要手动添加set/get方法避免使用crash" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"2.本类和分类的话，分类优先于本类的方法" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"3.如有多个分类都实现了相同的方法，执行顺序是 targets->Build Phases->Complie Source，顺序是从上到下" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"4.Categray是运行时添加，在编译过程一些如重名的方法并不会被检测出" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"5.Category 是表示一个指向分类的结构体的指针" target:self selector:@selector(todo)];
    /*
        Category 是表示一个指向分类的结构体的指针，其定义如下：
        typedef struct objc_category *Category;
        struct objc_category {
            char *category_name                          OBJC2_UNAVAILABLE; // 分类名
            char *class_name                             OBJC2_UNAVAILABLE; // 分类所属的类名
            struct objc_method_list *instance_methods    OBJC2_UNAVAILABLE; // 实例方法列表
            struct objc_method_list *class_methods       OBJC2_UNAVAILABLE; // 类方法列表
            struct objc_protocol_list *protocols         OBJC2_UNAVAILABLE; // 分类所实现的协议列表
    */
}

- (void)todo {
    
}

//添加自定义方法（为有/无源码类）
- (void)appendMethod {
    
}

//开放私有方法（为有/无源码类）
- (void)publicPrivateMethod {
    
}

@end
