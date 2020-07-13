//
//  OCImportController.m
//  Programming
//
//  Created by Peace on 7/10/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCImportController.h"

@interface OCImportController ()

@end

@implementation OCImportController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"#import"" 与 #import<> 区别："];
    [self.model appendDarkItemWithTitle:@"\n\n二者的区别在于：当被include的文件路径不是绝对路径的时候，有不同的搜索顺序。" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"#import <> :"];
    [self.model appendDarkItemWithTitle:@"对于使用尖括号<>来include文件，搜索的时候按以下顺序：\n在编译器设置的include路径内搜索；\n\n  如果上一步找不到，则在系统的include环境变量内搜索" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"#import \"\":"];
    [self.model appendDarkItemWithTitle:@"对于使用双引号""来include文件，搜索的时候按以下顺序：先在这条include指令的父文件所在文件夹内搜索，所谓的父文件，就是这条include指令所在的文件\n\n如果上一步找不到，则在父文件的父文件所在文件夹内搜索；\n\n如果上一步找不到，则在编译器设置的include路径内搜索；\n\n如果上一步找不到，则在系统的include环境变量内搜索\n\n" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"@import"];
    [self.model appendDarkItemWithTitle:@"xxx" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"Include"];
    [self.model appendDarkItemWithTitle:@"#include : 是C语言的预处理指令之一，所谓预处理，就是在编译之前做的处理，预处理指令一般以 # 开头\n\n#include 指令后面会跟着一个文件名，预处理器发现 #include 指令后，就会根据文件名去查找文件，并把这个文件的内容包含到当前文件中。被包含文件中的文本将替换源文件中的 #include 指令，就像你把被包含文件中的全部内容拷贝到这个 #include 指令所在的位置一样。所以第一行指令的作用是将stdio.h文件里面的所有内容拷贝到第一行中。\n\n如果被包含的文件拓展名为.h，我们称之为\"头文件\"(Header File)，头文件可以用来声明函数，要想使用这些函数，就必须先用 #include 指令包含函数所在的头文件\n\n#include 指令不仅仅限于.h头文件，可以包含任何编译器能识别的C/C++代码文件，包括.c、.hpp、.cpp等，甚至.txt、.abc等等都可以\n\n\n" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"#include \"\" : 当包含我们自己写的文件就是使用" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"#include <> : 包含系统􏰀供头文件的时候使用" class:[UIViewController class]];
    
    [self.model appendOpenedHeader:@"@class"];
    [self.model appendDarkItemWithTitle:@"告诉编译器已经声明了其后名称的类，至于这些类是如何定义的暂时不用考虑" class:[UIViewController class]];
}

@end
