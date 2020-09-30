//
//  iOSMonitorController.m
//  Programming
//
//  Created by Peace on 9/28/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "iOSMonitorController.h"
#import "iOSDelayMonitorController.h"

@interface iOSMonitorController ()

@end

@implementation iOSMonitorController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"Monitor:"];
    [self.model appendDarkItemWithTitle:@"Thread" class:[iOSDelayMonitorController class]];
    [self.model appendDarkItemWithTitle:@"CPU" class:[UIViewController class]];
    [self.model appendDarkItemWithTitle:@"Method" class:[UIViewController class]];
}

@end
