//
//  NSObject+Weak.m
//  Programming
//
//  Created by Peace on 11/14/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "NSObject+Weak.h"

#import <objc/runtime.h>

static NSString *WEAK_KEY = @"weakObj";
static NSString *WEAKHASH_KEY = @"WEAKHASH_KEY";

@interface NSObject (Weak)
@property (nonatomic, strong) NSMutableDictionary *weakHash;
@end

@implementation NSObject (Weak)

- (id)weakObj {
    return objc_getAssociatedObject(self, &WEAK_KEY);
}

- (void)setWeakObj:(id)weakObj {
    void(^block)(void) = ^{
        NSLog(@"block");
        objc_setAssociatedObject(self, &WEAK_KEY, nil, OBJC_ASSOCIATION_ASSIGN);
    };
    
    NSObject *object = (NSObject *)weakObj;
    if (!object.weakHash) {
        object.weakHash = [NSMutableDictionary dictionary];
    }
    [object.weakHash setValue:block forKey:[NSString stringWithFormat:@"%lu",[self hash]]];
    NSLog(@"%@",object.weakHash);
    
    objc_setAssociatedObject(self, &WEAK_KEY, weakObj, OBJC_ASSOCIATION_ASSIGN);
}

- (NSMutableDictionary *)weakHash {
    return objc_getAssociatedObject(self, &WEAKHASH_KEY);
}

- (void)setWeakHash:(NSMutableDictionary *)weakHash {
    objc_setAssociatedObject(self, &WEAKHASH_KEY, weakHash, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (void)dealloc {
    for (void(^block)(void) in self.weakHash.allValues) {
        block();
    }
    objc_setAssociatedObject(self, &WEAKHASH_KEY, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
