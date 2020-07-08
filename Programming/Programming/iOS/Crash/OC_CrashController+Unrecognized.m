//
//  OC_CrashController+Unrecognized.m
//  Objective-C
//
//  Created by Peace on 1/10/20.
//  Copyright © 2020 peace. All rights reserved.
//

#import "OC_CrashController+Unrecognized.h"

@implementation OC_CrashController (Unrecognized)

- (void)testSendToInstance {
    [self performSelector:@selector(test1)];
}

- (void)testSendToClass {
    [[self class] performSelector:@selector(test2)];
}

- (void)testCategoryProperty {
    self.testUnrecognized = @"abc";
}

@end
