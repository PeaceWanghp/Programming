//
//  OCTestProtocol.m
//  Programming
//
//  Created by Peace on 7/9/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCTestProtocol.h"

@implementation OCTestProtocol

- (void)testAction {
    if (_delegate && [_delegate respondsToSelector:@selector(testProtocol)]) {
        int value = [_delegate testProtocol];
        NSLog(@"1.value = %d",value);
    }
}

- (void)test2Action {
    if (_interDelegate && [_interDelegate respondsToSelector:@selector(testInterProtocol)]) {
        int value = [_interDelegate testInterProtocol];
        NSLog(@"2.value = %d",value);
    }
}

@end
