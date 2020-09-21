//
//  OCAutoreleaseController.m
//  Programming
//
//  Created by Peace on 8/19/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCAutoreleaseController.h"

#import "OCAutoreleaseObject.h"

@interface OCAutoreleaseController ()

@end

@implementation OCAutoreleaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendDarkItemTitle:@"__autoreleas" target:self selector:@selector(autoreleaseAction)];
    [self.model appendDarkItemTitle:@"@autoreleaspool" target:self selector:@selector(autoreleasepoolAction)];
    [self.model appendDarkItemTitle:@"Thread autoreleaspool" target:self selector:@selector(threadAutoreleasepool)];
}

- (void)autoreleaseAction {
    __unsafe_unretained OCAutoreleaseObject *unsafeObj;
    {
        OCAutoreleaseObject *obj = [OCAutoreleaseObject new];
        NSLog(@"%@",[obj valueForKey:@"retainCount"]);
    
        __autoreleasing OCAutoreleaseObject *autoObj = obj;
        NSLog(@"%@",[obj valueForKey:@"retainCount"]);
        NSLog(@"%@",[autoObj valueForKey:@"retainCount"]);
        
        unsafeObj = obj;
        NSLog(@"%@",[obj valueForKey:@"retainCount"]);
        NSLog(@"%@",[autoObj valueForKey:@"retainCount"]);
        NSLog(@"%@",[unsafeObj valueForKey:@"retainCount"]);
    }
    NSLog(@"%@",[unsafeObj valueForKey:@"retainCount"]);
    NSLog(@"++++++++++++");
}

- (void)autoreleasepoolAction {

    for (int i=0; i<10; i++) {
        __autoreleasing OCAutoreleaseObject *obj = [[OCAutoreleaseObject alloc] init];
        obj.tag = i;
    }
    
    NSLog(@"---------------------");
    
    for (int i=10; i<20; i++) {
        @autoreleasepool {
            __autoreleasing OCAutoreleaseObject *obj = [[OCAutoreleaseObject alloc] init];
            obj.tag = i;
        }
    }
}

- (void)threadAutoreleasepool {
    [NSThread detachNewThreadSelector:@selector(threadSelector) toTarget:self withObject:nil];
    NSLog(@"------------");
}

- (void)threadSelector {
    NSLog(@"%@",[NSThread currentThread]);
    
    for (int i=0; i<10; i++) {
        __autoreleasing OCAutoreleaseObject *obj = [[OCAutoreleaseObject alloc] init];
        obj.tag = i;
    }
    
    for (int i=10; i<20; i++) {
        @autoreleasepool {
            __autoreleasing OCAutoreleaseObject *obj = [[OCAutoreleaseObject alloc] init];
            obj.tag = i;
        }
    }
}

@end
