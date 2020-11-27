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
    [self.model appendDarkItemWithTitle:@"fps_runloop" class:[iOSDelayMonitorController class]];
    [self.model appendDarkItemWithTitle:@"fps_displaylink" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"CPU" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"Method" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"FPS(FramesPerSecond)/--监控卡顿Qi_ObjcMsgHook/约束过多"
                              class:[UIViewController class]];
}

@end
