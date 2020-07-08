//
//  OCPointerController.m
//  Programming
//
//  Created by Peace on 7/8/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCPointerController.h"

@interface OCPointerController ()

@end

@implementation OCPointerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendItemWithTitle:@"指针值" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"指针地址" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"指针值地址" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"指针的指针" class:[UIViewController class]];
}

@end
