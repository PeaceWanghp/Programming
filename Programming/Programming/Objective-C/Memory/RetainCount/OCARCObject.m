//
//  OCARCObject.m
//  Programming
//
//  Created by Peace on 7/15/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCARCObject.h"

@implementation OCARCObject

- (void)dealloc {
    NSLog(@"%ld : %s",(long)_tag,__func__);
}

@end
