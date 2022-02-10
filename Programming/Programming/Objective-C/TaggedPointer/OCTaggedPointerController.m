//
//  OCTaggedPointerController.m
//  Programming
//
//  Created by wangheping on 2022/2/10.
//  Copyright © 2022 Peace. All rights reserved.
//

#import "OCTaggedPointerController.h"

@interface OCTaggedPointerController ()

@end

@implementation OCTaggedPointerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"原理："];
    [self.model appendDarkItemTitle:@"xxx" target:self selector:@selector(todo)];
}

@end
