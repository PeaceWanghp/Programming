//
//  iOSRecursionController.m
//  Programming
//
//  Created by heping wang on 2023/4/13.
//  Copyright © 2023 Peace. All rights reserved.
//

#import "iOSRecursionController.h"

@interface iOSRecursionController ()

@end

@implementation iOSRecursionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"递归："];
    [self.model appendDarkItemTitle:@"test 1" target:self selector:@selector(test1)];
}

- (void)test1 {
    int value = 0;
    value = [self testRecursion:1];
    NSLog(@"value = %d", value);
}

- (int)testRecursion:(int)num {
    int a = num;
    int b = 0;
    if (num > 10) {
        return num;
    }
    
    NSLog(@"a = %d", a);
    a += num;
    b = [self testRecursion:a];
    NSLog(@"b = %d", b);
    
    return a ++;
}

@end
