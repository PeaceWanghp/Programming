//
//  OCPNullObject.m
//  Programming
//
//  Created by Peace on 8/31/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCPNullObject.h"

@implementation OCPNullObject

- (NSString *)getNikeName {
    if (!_nikeName) {
        return @"DefaultName";
    }
    return _nikeName;
}

- (void)setNikeName:(NSString *)nikeName {
    if ([_nikeName isEqual:nikeName]) {
        _nikeName = nil;
        
        if (!nikeName) {
            _nikeName = @"DefaultName";
        }
        _nikeName = nikeName;
    }
}

- (void)output {
    NSLog(@"\n");
    NSLog(@"name = %@",_name);
    NSLog(@"first name = %@",_firstName);
    NSLog(@"last name = %@",_lastName);
    NSLog(@"nike name = %@",_nikeName);
    NSLog(@"\n");
}

@end
