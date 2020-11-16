//
//  OCAddPropertyController.m
//  Programming
//
//  Created by Peace on 11/11/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCAddPropertyController.h"

#import "NSObject+Weak.h"

@interface OCAddPropertyController ()

@end

@implementation OCAddPropertyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    OBJC_ASSOCIATION_ASSIGN;            //assign策略
    OBJC_ASSOCIATION_COPY_NONATOMIC;    //copy策略
    OBJC_ASSOCIATION_RETAIN_NONATOMIC;  // retain策略

    OBJC_ASSOCIATION_RETAIN;
    OBJC_ASSOCIATION_COPY;
     */
    
    [self.model appendOpenedHeader:@"Association"];
    [self.model appendItemTitle:@"add assign" target:self selector:@selector(assignAction)];
    [self.model appendItemTitle:@"add strong" target:self selector:@selector(strongAction)];
    [self.model appendItemTitle:@"add unsafe_unretain" target:self selector:@selector(unsafe__unretainAction)];
    [self.model appendDarkItemTitle:@"add weak" target:self selector:@selector(weakAction)];
    [self.model appendItemTitle:@"add copy" target:self selector:@selector(copyAction)];
}

- (void)assignAction {
    
}

- (void)strongAction {
    
}

- (void)unsafe__unretainAction {
    
}

- (void)copyAction {
    
}

- (void)weakAction {
    NSObject *obj1 = [NSObject new];
    NSObject *obj2 = [NSObject new];
    
    NSObject *obj3 = [NSObject new];
    NSLog(@"%@%@%@",[obj1 description],[obj2 description],[obj3 description]);
    NSLog(@"%lu,%lu,%lu",(unsigned long)[obj1 hash],(unsigned long)[obj2 hash],(unsigned long)[obj3 hash]);
    
    obj1.weakObj = obj3;
    obj1.weakObj = obj3;
    obj2.weakObj = obj3;
    NSLog(@"%@", obj1.weakObj);
    NSLog(@"%@", obj2.weakObj);
    obj3 = nil;
    NSLog(@"%@", obj1.weakObj);
    NSLog(@"%@", obj2.weakObj);
    
    [obj2.weakObj copy];
    [obj1.weakObj copy];
}

@end
