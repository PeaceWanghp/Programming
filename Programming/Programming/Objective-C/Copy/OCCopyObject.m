//
//  OCCopyObject.m
//  Programming
//
//  Created by Peace on 7/14/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCCopyObject.h"

@implementation OCCopyObject

- (id)copyWithZone:(nullable NSZone *)zone {
    OCCopyObject *item = self;
    
    return item;
}

- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    OCCopyObject *item = [[[self class] alloc] init];
    item.name = [self.name copy];
    
    return item;
}

@end
