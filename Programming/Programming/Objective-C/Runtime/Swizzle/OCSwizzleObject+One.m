//
//  OCSwizzleObject+One.m
//  Programming
//
//  Created by Peace on 11/17/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCSwizzleObject+One.h"

@implementation OCSwizzleObject (One)

+ (void)load {
    NSLog(@"aaaaaa");
    [self exchangeInstanceMethod1:@selector(testLog) method2:@selector(testLog2)];
}

- (void)testLog2 {
    NSLog(@"2222222222");
}

@end
