//
//  OCPropertyController.m
//  Programming
//
//  Created by Peace on 7/16/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCPropertyController.h"

#import "OCPropertyObject.h"

@interface OCPropertyController ()

@end

@implementation OCPropertyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"1"];
    [self.model appendItemTitle:@"@property" target:self selector:@selector(todo1)];
    [self.model appendItemTitle:@"@synthesize" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"nonatomic" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"atomic" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"readonly" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"readwrite" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"copy" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"asign" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"strong" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"weak" target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"2"];
    [self.model appendItemTitle:@"getter (atomic/nonatomic)" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"setter (atomic/nonatomic)" target:self selector:@selector(todo)];
}

- (void)todo {
    OCPropertyObject *object = [OCPropertyObject new];
    NSLog(@"1.%@",[object valueForKey:@"retainCount"]);
    __weak typeof(object) weakObject = object;
    NSLog(@"2.%@",[object valueForKey:@"retainCount"]);
    NSLog(@"2.%@",[weakObject valueForKey:@"retainCount"]);
    OCPropertyObject *tmpObject = weakObject;
    NSLog(@"3.%@",[tmpObject valueForKey:@"retainCount"]);
    NSLog(@"3.%@",[weakObject valueForKey:@"retainCount"]);
    NSLog(@"3.%@",[object valueForKey:@"retainCount"]);
    object = nil;
    NSLog(@"4.%@",[tmpObject valueForKey:@"retainCount"]);
    NSLog(@"4.%@",[weakObject valueForKey:@"retainCount"]);
    NSLog(@"4.%@",[object valueForKey:@"retainCount"]);
    
}

- (void)todo1 {
    OCPropertyObject *object = [OCPropertyObject new];
    NSLog(@"1.%@",[object valueForKey:@"retainCount"]);
    __weak typeof(object) weakObject = object;
    NSLog(@"2.%@",[object valueForKey:@"retainCount"]);
    NSLog(@"2.%@",[weakObject valueForKey:@"retainCount"]);
    object = nil;
    NSLog(@"4.%@",[weakObject valueForKey:@"retainCount"]);
    NSLog(@"4.%@",[object valueForKey:@"retainCount"]);
}

@end
