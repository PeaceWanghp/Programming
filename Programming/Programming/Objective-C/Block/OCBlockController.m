//
//  OCBlockController.m
//  Programming
//
//  Created by Peace on 7/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCBlockController.h"

@interface OCBlockController ()

@end

@implementation OCBlockController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendDarkItemTitle:@"GlobBlock（全局）" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"StatckBlock（栈）" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"Block（堆）" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"self in block" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"weakSelf in block" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"__block in block" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"non__block in block" target:self selector:@selector(todo)];
}

- (void)todo {
    
}

@end
