//
//  OCBlockController+WeakStrong.m
//  Programming
//
//  Created by Peace on 9/16/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCBlockController+WeakStrong.h"

#import "OCBlockObject.h"

@implementation OCBlockController (WeakStrong)

- (void)testStrong {
    OCBlockObject *object = [OCBlockObject new];
    NSLog(@"1.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(object)));
    self.weakStrongBlock = ^ {
        NSLog(@"2.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(object)));
//        dispatch_async(dispatch_queue_create("aaaaa", DISPATCH_QUEUE_SERIAL), ^{
//            sleep(3);
//            NSLog(@"4.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(object)));
//        });
    };
    NSLog(@"3.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(object)));
    self.weakStrongBlock();
    NSLog(@"4.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(object)));
}

- (void)testWeak {
    OCBlockObject *object = [OCBlockObject new];
    NSLog(@"1.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(object)));
    __weak OCBlockObject *weakObject = object;
    NSLog(@"1.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(object)));
    self.weakStrongBlock = ^ {
        NSLog(@"3.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(weakObject)));
        dispatch_async(dispatch_queue_create("com.qqq.qqq", DISPATCH_QUEUE_SERIAL), ^{
            NSLog(@"----.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(weakObject)));
            sleep(3);
            NSLog(@"+++++.retainCount = %@",[weakObject valueForKey:@"retainCount"]);
        });
    };
    NSLog(@"5.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(object)));
    self.weakStrongBlock();
    NSLog(@"6.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(object)));
}

- (void)testWeakStrong {
    OCBlockObject *object = [OCBlockObject new];
    NSLog(@"1.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(object)));
    __weak OCBlockObject *weakObject = object;
    NSLog(@"1.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(object)));
    NSLog(@"1.1.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(weakObject)));
    self.weakStrongBlock = ^ {
        __strong OCBlockObject *strongObject = weakObject;
        if (!strongObject) {
            return;
        }
        
        NSLog(@"3.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(strongObject)));
        NSLog(@"3.1.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(weakObject)));
        dispatch_async(dispatch_queue_create("aaaaa", DISPATCH_QUEUE_SERIAL), ^{
            sleep(3);
            NSLog(@"4.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(strongObject)));
        });
    };
    NSLog(@"5.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(object)));
    NSLog(@"5.1.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(weakObject)));
    self.weakStrongBlock();
    NSLog(@"6.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(object)));
    NSLog(@"6.1.retainCount = %ld",(long)CFGetRetainCount((__bridge CFTypeRef)(weakObject)));
}

@end
