//
//  iOSMemoryLeakController.m
//  Programming
//
//  Created by Peace on 7/15/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "iOSMemoryLeakController.h"

@interface iOSMemoryLeakController ()

@end

@implementation iOSMemoryLeakController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendDarkItemTitle:@"普通对象互相持有" target:self selector:@selector(objectTakeObject)];
    [self.model appendDarkItemTitle:@"NSTimer" target:self selector:@selector(objectTakeObject)];
    [self.model appendDarkItemTitle:@"Block" target:self selector:@selector(objectTakeObject)];
}

- (void)objectTakeObject {
    
}

@end
