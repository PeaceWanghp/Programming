//
//  CLibsController.m
//  Programming
//
//  Created by Peace on 7/6/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "CLibsController.h"

@interface CLibsController ()

@end

@implementation CLibsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendItemTitle:@"<stddef.h>(标准定义)" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"<errno.h>（错误信息）" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"<stdio.h>（输入输出函数）" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"<math.h>（数学函数)" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"<ctype.h>（字符处理函数）" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"<string.h>（字符串函数）" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"<stdlib.h>（功能函数）" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"<asset.h>" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"<float.h>" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"<limits.h>" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"<locale.h>" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"<setjmp.h>" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"<signal.h>" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"<stdarg.h>" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"<time.h>" target:self selector:@selector(todo)];
}

- (void)todo {
    
}

@end
