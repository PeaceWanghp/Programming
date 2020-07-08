//
//  OC_CrashController+Operation.m
//  Objective-C
//
//  Created by Peace on 1/10/20.
//  Copyright © 2020 peace. All rights reserved.
//

#import "OC_CrashController+Operation.h"

@implementation OC_CrashController (Operation)

- (void)arrayInsertNil {
    NSObject *object = nil;
    NSArray *array = @[object];
}

- (void)arrayBeyond {
    NSArray *array = @[@1,@2,@3];
    [array objectAtIndex:4];
}

- (void)arrayEnumerateAndRemove {
    NSMutableArray* array = [NSMutableArray array];
    [array addObject:@1];
    [array addObject:@2];
    [array addObject:@3];
    [array addObject:@4];
    // 不崩溃
    [array enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.integerValue == 1) {
            [array removeObject:obj];
        }
    }];
    // 崩溃，reason: '*** Collectionwas mutated while being enumerated.'
    for (NSNumber* obj in array) {
        if (obj.integerValue == 2) {
            [array removeObject:obj];
        }
    }
}

- (void)dictionaryInsertNil {
    NSObject *object = nil;
    NSDictionary *dictionary = @{@"key":object};
}

- (void)mapTableInsertNil {
    NSObject *object = nil;
    
    NSMapTable *mapTable = [[NSMapTable alloc] init];
    [mapTable setValue:object forKey:@"key"];
}

@end
