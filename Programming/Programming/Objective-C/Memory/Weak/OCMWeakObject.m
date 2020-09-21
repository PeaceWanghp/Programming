//
//  OCMWeakObject.m
//  Programming
//
//  Created by Peace on 9/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCMWeakObject.h"

@implementation OCMWeakObject

- (void)dealloc {
    NSLog(@"%s %d",__func__,self.tag);
}

@end
