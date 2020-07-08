//
//  OCKeywordsController.m
//  Programming
//
//  Created by Peace on 7/8/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCKeywordsController.h"

@interface OCKeywordsController ()

@end

@implementation OCKeywordsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendItemWithTitle:@"const" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"extern" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"static" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"#define" class:[UIViewController class]];
}

@end
