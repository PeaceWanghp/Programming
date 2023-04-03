//
//  ALGBigOController.m
//  Programming
//
//  Created by heping wang on 2023/3/22.
//  Copyright © 2023 Peace. All rights reserved.
//

#import "ALGBigOController.h"

@interface ALGBigOController ()

@end

@implementation ALGBigOController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"Big O notation (大O符号)"];
    [self.model appendDarkItemTitle:@"又称为“渐进符号”, 是用于描述函数渐近行为的数学符号。更确切地说，它是用另一个（通常更简单的）函数来描述一个函数数量级的渐近上界。在数学中，它一般用来刻画被截断的无穷级数尤其是渐近级数的剩余项；在计算机科学中，它在分析算法复杂性的方面非常有用。代表“order of ...”（……阶）的大O, 希腊字母“Ο”（omicron）" target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"时间复杂度"];
    [self.model appendDarkItemTitle:@"常数阶 O(1)" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"对数阶 O(log n)" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"线性阶 O(n)" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"线性阶 O(m+n)" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"线性对数阶 O(n log n)" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"平方阶 O(n^2) ---不推荐" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"立方阶 O(n^3) ---不推荐" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"K次方阶 O(n^k) ---不推荐" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"指数阶 O(2^n) ---不推荐" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"阶乘 O(n!) ---不推荐" target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"空间复杂度"];
    [self.model appendDarkItemTitle:@"O(1)" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"O(n)" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"O(n^2)" target:self selector:@selector(todo)];
}

@end
