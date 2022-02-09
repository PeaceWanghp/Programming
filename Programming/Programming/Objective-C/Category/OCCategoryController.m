//
//  OCCategoryController.m
//  Programming
//
//  Created by wangheping on 2022/2/9.
//  Copyright © 2022 Peace. All rights reserved.
//

#import "OCCategoryController.h"

@interface OCCategoryController ()

@end

@implementation OCCategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"Category"];
    [self.model appendItemTitle:@"多个category 实现一个方法不覆盖" target:self selector:@selector(todo)];
}

@end
