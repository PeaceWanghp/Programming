//
//  OCAutoreleaseObject.m
//  Programming
//
//  Created by Peace on 8/19/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCAutoreleaseObject.h"

@implementation OCAutoreleaseObject

- (void)dealloc {
    NSLog(@"%s %d",__func__,self.tag);
}

@end
