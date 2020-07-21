//
//  ALGStackController.m
//  Programming
//
//  Created by Peace on 7/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ALGStackController.h"

@interface ALGStackController ()

@end

@implementation ALGStackController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendItemTitle:@"反转" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"栈转队列" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"队列转栈" target:self selector:@selector(todo)];
}

@end
