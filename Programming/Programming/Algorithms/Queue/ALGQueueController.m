//
//  ALGQueueController.m
//  Programming
//
//  Created by Peace on 7/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ALGQueueController.h"

@interface ALGQueueController ()

@end

@implementation ALGQueueController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"数组队列"];
    [self.model appendDarkItemTitle:@"+" target:self selector:@selector(testArrayQueueCome)];
    [self.model appendDarkItemTitle:@"-" target:self selector:@selector(testArrayQueueLeave)];
    
    [self.model appendOpenedHeader:@"链式队列"];
    [self.model appendDarkItemTitle:@"+" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"-" target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"其他队列"];
    [self.model appendDarkItemTitle:@"双端队列" target:self selector:@selector(todo)];
}

- (void)todo {
    
}

@end
