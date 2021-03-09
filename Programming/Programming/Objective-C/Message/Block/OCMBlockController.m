//
//  OCMBlockController.m
//  Programming
//
//  Created by wangheping on 2021/3/9.
//  Copyright © 2021 Peace. All rights reserved.
//

#import "OCMBlockController.h"

#import "OCMessageObject.h"

@interface OCMBlockController ()
{
    OCMessageObject *_messageObject;
}
@end

@implementation OCMBlockController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendDarkItemTitle:@"Todo" target:self selector:@selector(todo)];
    
    _messageObject = [OCMessageObject new];
    _messageObject.tapBlock = ^(int tag) {
        NSLog(@"tag = %d",tag);
    };
}

- (void)todo {
    [_messageObject testBlockAction];
}

@end
