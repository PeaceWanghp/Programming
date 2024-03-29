//
//  OC_TimerViewController.m
//  Objective-C
//
//  Created by Peace on 11/22/19.
//  Copyright © 2019 peace. All rights reserved.
//

#import "OCTimerController.h"

#import "OC_Test_NSTimer.h"
#import "OCGCDTimer.h"
#import "OCARCObject.h"

@interface OCTimerController ()
{
    OC_Test_NSTimer *_timer;
    OC_Test_NSTimer *_weakTimer;
    OC_Test_NSTimer *_exactWeakTimer;
    OCGCDTimer *_gcdTimer;
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
    _exactWeakTimer = [[OC_Test_NSTimer alloc] init];
    _gcdTimer = [[OCGCDTimer alloc] init];
    
    [self.model appendOpenedHeader:@"NSTimer"];
    [self.model appendDarkItemTitle:@"timer强引用原因" target:self selector:@selector(strongPrinciple)];
    [self.model appendDarkItemTitle:@"weak timerTarget为什么不能解决timer的强引用" target:self selector:@selector(todo)];
    [self.model appendDarkItemTitle:@"timer强引用3种解决方法" target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"NSTimer（默认 Strong）"];
    [self.model appendDarkItemTitle:@"Start" target:_timer selector:@selector(startTimer)];
    [self.model appendDarkItemTitle:@"Stop" target:_timer selector:@selector(invalidateTimer)];
    [self.model appendDarkItemTitle:@"Fire(手动触发)" target:_timer selector:@selector(fireTimer)];
    
    [self.model appendOpenedHeader:@"Block NSTimer"];
    [self.model appendDarkItemTitle:@"Start" target:_timer selector:@selector(blockTimer)];
    [self.model appendDarkItemTitle:@"Stop" target:_timer selector:@selector(invalidateTimer)];
    [self.model appendDarkItemTitle:@"Fire(手动触发)" target:_timer selector:@selector(fireTimer)];
    
    [self.model appendOpenedHeader:@"NSTimer（手动 Weak）"];
    [self.model appendDarkItemTitle:@"Start" target:_weakTimer selector:@selector(startWeakTimer)];
    [self.model appendDarkItemTitle:@"Stop" target:_weakTimer selector:@selector(invalidateTimer)];
    [self.model appendDarkItemTitle:@"Fire(手动触发)" target:_weakTimer selector:@selector(fireTimer)];
    
    [self.model appendOpenedHeader:@"NSTimer（手动 Weak + 准确）"];
    [self.model appendDarkItemTitle:@"Start" target:_exactWeakTimer selector:@selector(startExactTimer)];
    [self.model appendDarkItemTitle:@"Stop" target:_exactWeakTimer selector:@selector(invalidateTimer)];
    [self.model appendDarkItemTitle:@"Fire(手动触发)" target:_exactWeakTimer selector:@selector(fireTimer)];
    
    [self.model appendOpenedHeader:@"GCD Timer"];
    [self.model appendDarkItemTitle:@"Start" target:_gcdTimer selector:@selector(startTimer)];
    [self.model appendDarkItemTitle:@"Stop" target:_gcdTimer selector:@selector(stopTimer)];
    
    [self.model appendOpenedHeader:@"NSTimer与GCD_timer区别"];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

#pragma mark -
#pragma mark -- TIMER
- (void)strongPrinciple {
    OCARCObject *obj = [OCARCObject new];
    NSLog(@"1.%@",[obj valueForKey:@"retainCount"]);
    __weak typeof(obj) weakObj = obj;
    NSLog(@"2.%@",[obj valueForKey:@"retainCount"]);
    id obj1 = weakObj;
    NSLog(@"3.%@",[obj valueForKey:@"retainCount"]);
    
    OCARCObject *obj_a = [OCARCObject new];
    NSLog(@"4.%@",[obj_a valueForKey:@"retainCount"]);
    OCARCObject *__strong *ppointer = &obj_a;
    NSLog(@"4.%@",[obj_a valueForKey:@"retainCount"]);
    __strong OCARCObject **ppointer1 = &obj_a;
    NSLog(@"4.%@",[obj_a valueForKey:@"retainCount"]);
    
}

@end
