//
//  OCGCDController.m
//  Programming
//
//  Created by Peace on 9/2/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCGCDController.h"

#import "OCGCDOnceController.h"
#import "OCSemaphoreController.h"

@interface OCGCDController ()

@end

@implementation OCGCDController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"queue"];
    [self.model appendItemTitle:@"queue" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"async" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"sync" target:self selector:@selector(todo)];
    [self.model appendDarkItemWithTitle:@"once" class:[OCGCDOnceController class]];
    [self.model appendDarkItemWithTitle:@"semaphore" class:[OCSemaphoreController class]];
    [self.model appendItemTitle:@"barrier" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"after" target:self selector:@selector(afterAction)];
    [self.model appendItemTitle:@"apply" target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"group"];
    [self.model appendItemTitle:@"create" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"async" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"wait" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"enter" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"leave" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"notify" target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"timer"];
    [self.model appendItemTitle:@"dispatch_time" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"dispatch_walltime" target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"io"];
    [self.model appendItemTitle:@"create" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"read" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"write" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"close" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"barrier" target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"block"];
    [self.model appendItemTitle:@"create" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"perform" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"wait" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"notify" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"cancel" target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"introspection"];
    [self.model appendItemTitle:@"..." target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"data"];
    [self.model appendItemTitle:@"..." target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"object"];
    [self.model appendItemTitle:@"..." target:self selector:@selector(todo)];
}

- (void)afterAction {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"执行任务");
    });
}

@end
