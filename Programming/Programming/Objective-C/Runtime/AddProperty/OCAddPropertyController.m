//
//  OCAddPropertyController.m
//  Programming
//
//  Created by Peace on 11/11/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCAddPropertyController.h"

@interface OCAddPropertyController ()

@end

@implementation OCAddPropertyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"xxx"];
    [self.model appendItemTitle:@"add assgin" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"add strong" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"add unsafe_unretain" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"add weak" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"add copy" target:self selector:@selector(todo)];
}

@end
