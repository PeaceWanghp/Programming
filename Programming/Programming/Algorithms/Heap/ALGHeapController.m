//
//  ALGHeapController.m
//  Programming
//
//  Created by Peace on 7/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "ALGHeapController.h"

@interface ALGHeapController ()

@end

@implementation ALGHeapController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"堆"];
    [self.model appendItemTitle:@"大顶堆/大根堆" target:self selector:@selector(todo)];
}

- (void)todo {
    
}

@end
