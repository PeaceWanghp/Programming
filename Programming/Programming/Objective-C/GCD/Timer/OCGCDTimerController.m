//
//  OCGCDTimerController.m
//  Programming
//
//  Created by Peace on 9/30/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCGCDTimerController.h"

#import "OCGCDTimer.h"

@interface OCGCDTimerController ()
{
    OCGCDTimer *_gcdTimer;
}
@end

@implementation OCGCDTimerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _gcdTimer = [[OCGCDTimer alloc] init];
    
    [self.model appendOpenedHeader:@"GCD Timer"];
    [self.model appendDarkItemTitle:@"Start" target:_gcdTimer selector:@selector(startTimer)];
    [self.model appendDarkItemTitle:@"Stop" target:_gcdTimer selector:@selector(stopTimer)];
}

@end
