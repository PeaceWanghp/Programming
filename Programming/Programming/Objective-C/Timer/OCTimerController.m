//
//  OC_TimerViewController.m
//  Objective-C
//
//  Created by Peace on 11/22/19.
//  Copyright © 2019 peace. All rights reserved.
//

#import "OCTimerController.h"

#import "OC_Test_NSTimer.h"
#import "OC_Test_CADisplayLink.h"
#import "OC_Test_GCDTimer.h"

@interface OCTimerController ()
{
    OC_Test_NSTimer *_timer;
    OC_Test_NSTimer *_weakTimer;
    OC_Test_CADisplayLink *_displayLink;
    OC_Test_GCDTimer *_gcdTimer;
}
@end

@implementation OCTimerController

#pragma mark -
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _timer = [[OC_Test_NSTimer alloc] init];
    _weakTimer = [[OC_Test_NSTimer alloc] init];
    _displayLink = [[OC_Test_CADisplayLink alloc] init];
    _gcdTimer = [[OC_Test_GCDTimer alloc] init];
    
    [self.model appendOpenedHeader:@"NSTimer"];
    [self.model appendDarkItemTitle:@"Start NSTimer" target:_timer selector:@selector(startTimer)];
    [self.model appendDarkItemTitle:@"Stop Timer" target:_timer selector:@selector(invalidateTimer)];
    [self.model appendDarkItemTitle:@"Fire Timer" target:_timer selector:@selector(fireTimer)];
    [self.model appendDarkItemTitle:@"Excat Timer" target:_timer selector:@selector(exactTimer)];
    
    [self.model appendOpenedHeader:@"NSTimer(Weak)"];
    [self.model appendDarkItemTitle:@"Start Weak NSTimer" target:_weakTimer selector:@selector(startWeakTimer)];
    [self.model appendDarkItemTitle:@"Stop Weak Timer" target:_weakTimer selector:@selector(invalidateTimer)];
    [self.model appendDarkItemTitle:@"Fire Weak Timer" target:_weakTimer selector:@selector(fireTimer)];
    [self.model appendDarkItemTitle:@"Excat Weak Timer" target:_weakTimer selector:@selector(exactTimer)];
    
    [self.model appendOpenedHeader:@"CADisplayLink"];
    [self.model appendDarkItemTitle:@"Start Link" target:_displayLink selector:@selector(startLink)];
    [self.model appendDarkItemTitle:@"Cancel" target:_displayLink selector:@selector(cancel)];
    
    [self.model appendOpenedHeader:@"GCD Timer"];
    [self.model appendDarkItemTitle:@"Start GCD Timer" target:_gcdTimer selector:@selector(dispatchSourceTimer)];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
