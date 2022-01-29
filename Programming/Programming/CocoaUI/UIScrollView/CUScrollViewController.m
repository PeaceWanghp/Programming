//
//  CUScrollViewController.m
//  Programming
//
//  Created by wangheping on 2022/1/28.
//  Copyright © 2022 Peace. All rights reserved.
//

#import "CUScrollViewController.h"

#import "CUNestingScrollViewController.h"
#import "CUInsetScrollViewController.h"

@interface CUScrollViewController ()

@end

@implementation CUScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendDarkItemWithTitle:@"ScrollView上下嵌套" class:[CUNestingScrollViewController class]];
    [self.model appendDarkItemWithTitle:@"ScrollView Inset" class:[CUInsetScrollViewController class]];
}

@end
