//
//  CBasicController.m
//  Programming
//
//  Created by Peace on 7/26/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "CBasicController.h"

#include "CPointer.h"

@interface CBasicController ()

@end

@implementation CBasicController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"Basic (基础)"];
    [self.model appendDarkItemTitle:@"Pointer (指针)" target:self selector:@selector(pointerAction)];

}

- (void)pointerAction {
    test1();
}

@end
