//
//  OCInheritObject.m
//  Programming
//
//  Created by Peace on 7/10/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCInheritObject.h"

@implementation OCInheritObject

+ (void)load {
    NSLog(@"%s,%@",__func__,[NSThread currentThread]);
}

+ (void)initialize {
    NSLog(@"%s,%@",__func__,[NSThread currentThread]);
    sleep(3);
    NSLog(@"sleep done");
}

- (void)testTodo {
    NSLog(@"%s",__func__);
}

@end
