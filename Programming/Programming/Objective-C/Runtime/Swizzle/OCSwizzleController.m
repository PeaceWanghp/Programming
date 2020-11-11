//
//  OCSwizzleController.m
//  Programming
//
//  Created by Peace on 11/11/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCSwizzleController.h"

@interface OCSwizzleController ()

@end

@implementation OCSwizzleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"Swizzle:"];
    [self.model appendItemTitle:@"exchangeImplementations" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"class_replaceMethod" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"method_setImplementation" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"三次swizzle一个方法会如何" target:self selector:@selector(todo)];
}

@end
