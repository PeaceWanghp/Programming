//
//  OCPSetterGetterObject.m
//  Programming
//
//  Created by Peace on 8/31/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCPSetterGetterObject.h"

@implementation OCPSetterGetterObject

@synthesize name = _name;

- (int)age {
    return _age;
}

- (void)setAge:(int)age {
    _age = age;
}

- (NSString *)nikeName {
    return @"2222";
}

- (void)setNikeNge:(NSString *)name {
    _name = @"333";
}

@end
