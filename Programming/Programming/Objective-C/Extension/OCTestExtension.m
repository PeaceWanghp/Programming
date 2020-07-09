//
//  OCTestExtension.m
//  Programming
//
//  Created by Peace on 7/9/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCTestExtension.h"
#import "OCTestExtension+Extension.h"

@implementation OCTestExtension

- (void)testMethod {
    NSLog(@"%s",__func__);
}

+ (void)testClassMethod {
    NSLog(@"%s",__func__);
}

@end
