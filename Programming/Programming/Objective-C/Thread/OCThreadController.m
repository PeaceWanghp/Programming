//
//  OCThreadController.m
//  Programming
//
//  Created by Peace on 7/6/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCThreadController.h"

@interface OCThreadController ()

@end

@implementation OCThreadController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"NSThread"];
    [self.model appendItemTitle:@"..." target:nil selector:nil];
    
    [self.model appendOpenedHeader:@"Operation"];
    [self.model appendItemTitle:@"..." target:nil selector:nil];
    
    [self.model appendOpenedHeader:@"GCD"];
    [self.model appendItemTitle:@"..." target:nil selector:nil];
}

@end
