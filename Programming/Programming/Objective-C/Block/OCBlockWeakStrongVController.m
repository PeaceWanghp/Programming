//
//  OCBlockWeakStrongVController.m
//  Programming
//
//  Created by wangheping on 2021/2/18.
//  Copyright © 2021 Peace. All rights reserved.
//

#import "OCBlockWeakStrongVController.h"

#import "OCBlockWeakStrongObject.h"
#import "OCBlockObject.h"

@interface OCBlockWeakStrongVController ()
{
    OCBlockWeakStrongObject *_obj;
}
@property(nonatomic,strong) void(^weakStrongBlock)(void);
@end

@implementation OCBlockWeakStrongVController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"Life Cycle:"];
    [self.model appendDarkItemTitle:@"Self" target:self selector:@selector(selfBlock)];
    [self.model appendDarkItemTitle:@"Weak Self" target:self selector:@selector(weakSelfBlock)];
    [self.model appendDarkItemTitle:@"Strong Self" target:self selector:@selector(strongSelfBlock)];
    
    [self.model appendOpenedHeader:@"RetainCount:"];
    [self.model appendDarkItemTitle:@"strong" target:self selector:@selector(testStrong)];
    [self.model appendDarkItemTitle:@"weak" target:self selector:@selector(testWeak)];
    [self.model appendDarkItemTitle:@"weak/strong" target:self selector:@selector(testWeakStrong)];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

- (void)selfBlock {
    if (!_obj) {
        _obj = [OCBlockWeakStrongObject new];
        [_obj selfBlock];
    }
    else {
        _obj = nil;
    }
}

- (void)weakSelfBlock {
    if (!_obj) {
        _obj = [OCBlockWeakStrongObject new];
        [_obj weakSelfBlock];
    }
    else {
        _obj = nil;
    }
}

- (void)strongSelfBlock {
    if (!_obj) {
        _obj = [OCBlockWeakStrongObject new];
        [_obj weakStrongSelfBlock];
    }
    else {
        _obj = nil;
    }
}


#pragma mark -
#pragma mark -- RetainCount
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
