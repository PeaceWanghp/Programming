//
//  OC_CrashObject.m
//  Programming
//
//  Created by heping wang on 2023/12/31.
//  Copyright © 2023 Peace. All rights reserved.
//

#import "OC_CrashObject.h"

@implementation OC_CrashObject

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(actionNotification) name:@"xxx_xxx" object:nil];
    }
    return self;
}

- (void)actionNotification {
    NSLog(@"%s",__func__);
}

- (void)dealloc {
    NSLog(@"%s",__func__);
//    self.string = @"111111111111111111111";
}

@end
