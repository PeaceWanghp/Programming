//
//  testAutoreleaseObject.m
//  Programming
//
//  Created by Peace on 9/28/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "testAutoreleaseObject.h"

@implementation testAutoreleaseObject

- (void)dealloc {
    NSLog(@"%s:tag = %d",__func__,_tag);
}

@end
