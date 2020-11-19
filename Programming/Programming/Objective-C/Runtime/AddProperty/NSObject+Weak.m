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
//static NSString *WEAKHASH_KEY = @"WEAKHASH_KEY";
static NSString *MAPHASH_KEY = @"MAPHASH_KEY";

@interface NSObject (Weak)
//@property (nonatomic, strong) NSMutableDictionary *weakHash;
@property (nonatomic, strong) NSMapTable *mapTable;
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
//    if (!object.weakHash) {
//        object.weakHash = [NSMutableDictionary dictionary];
//    }
//    [object.weakHash setValue:block forKey:[NSString stringWithFormat:@"%lu",[self hash]]];
//    NSLog(@"%@",object.weakHash);
    
    if (!object.mapTable) {
        object.mapTable = [NSMapTable strongToWeakObjectsMapTable];
    }
    [object.mapTable setObject:block forKey:[NSString stringWithFormat:@"%lu",[self hash]]];
    
    objc_setAssociatedObject(self, &WEAK_KEY, weakObj, OBJC_ASSOCIATION_ASSIGN);
}

//- (NSMutableDictionary *)weakHash {
//    return objc_getAssociatedObject(self, &WEAKHASH_KEY);
//}
//
//- (void)setWeakHash:(NSMutableDictionary *)weakHash {
//    objc_setAssociatedObject(self, &WEAKHASH_KEY, weakHash, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}

- (NSMapTable *)mapTable {
    return objc_getAssociatedObject(self, &MAPHASH_KEY);
}

- (void)setMapTable:(NSMapTable *)mapTable {
    objc_setAssociatedObject(self, &MAPHASH_KEY, mapTable, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (void)dealloc {
    
    if(self.mapTable) {
        for (void(^block)(void) in NSAllMapTableValues(self.mapTable)) {
            block();
        }
    }
    
    objc_setAssociatedObject(self, &MAPHASH_KEY, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &WEAK_KEY, nil, OBJC_ASSOCIATION_ASSIGN);
}

- (void)testLog {
    NSLog(@"test log");
}

@end
