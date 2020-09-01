//
//  OCMultiDelegate.m
//  Programming
//
//  Created by Peace on 7/20/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCMultiDelegate.h"

@interface OCMultiDelegate ()
{
    NSArray *_delegates;
}
@end

@implementation OCMultiDelegate

- (instancetype)initWithArray:(NSArray *)delegates {
    self = [super init];
    if (self) {
        _delegates = delegates;
    }
    
    return self;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        for (id target in _delegates) {
            if ((signature = [target methodSignatureForSelector:aSelector])) {
                break;
            }
        }
    }
    
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    for (id target in _delegates) {
        if ([target respondsToSelector:anInvocation.selector]) {
            [anInvocation invokeWithTarget:target];
        }
    }
}

- (BOOL)respondsToSelector:(SEL)aSelector{
    if ([super respondsToSelector:aSelector]) {
        return YES;
    }

    for (id target in _delegates) {
        if ([target respondsToSelector:aSelector]) {
            return YES;
        }
    }

    return NO;
}

@end
