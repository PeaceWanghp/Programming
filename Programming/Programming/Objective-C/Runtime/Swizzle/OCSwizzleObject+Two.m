//
//  OCSwizzleObject+Two.m
//  Programming
//
//  Created by Peace on 11/17/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCSwizzleObject+Two.h"

@implementation OCSwizzleObject (Two)

+ (void)load {
    NSLog(@"bbbbbbb");
    [self exchangeInstanceMethod1:@selector(testLog) method2:@selector(testLog3)];
}

- (void)testLog3 {
    NSLog(@"333333333333");
}

@end
