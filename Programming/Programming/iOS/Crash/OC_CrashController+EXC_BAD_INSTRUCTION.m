//
//  OC_CrashController+EXC_BAD_INSTRUCTION.m
//  Objective-C
//
//  Created by Peace on 1/10/20.
//  Copyright © 2020 peace. All rights reserved.
//

#import "OC_CrashController+EXC_BAD_INSTRUCTION.h"

@implementation OC_CrashController (EXC_BAD_INSTRUCTION)

- (void)dispatchAyncMainQueue {
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"111");
    });
}

@end
