//
//  OCGCDAfterController.m
//  Programming
//
//  Created by Peace on 11/5/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCGCDAfterController.h"

@interface OCGCDAfterController ()

@end

@implementation OCGCDAfterController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self.model appendOpenedHeader:@"应用："];
    [self.model appendDarkItemTitle:@"倒计时n秒" target:self selector:@selector(nowAfter)];
    [self.model appendDarkItemTitle:@"指定时间" target:self selector:@selector(dateAfter)];
}

//After
- (void)nowAfter {
    
    dispatch_time_t time;
    
    time = dispatch_time(DISPATCH_TIME_FOREVER, 0);//永远不执行
    time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_MSEC));//从现在开始3毫秒后
    time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_USEC));//从现在开始3微秒后
    time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC));//从现在开始3秒后
    
    dispatch_after(time, dispatch_get_main_queue(), ^{
        NSLog(@"after done");
    });
}

- (void)dateAfter {
    //指定时间
    dispatch_time_t dateTime = dispatchTimeByDate([NSDate dateWithTimeIntervalSinceNow:3]);
    dispatch_after(dateTime, dispatch_get_main_queue(), ^{
        NSLog(@"date time after");
    });
}

//Time
dispatch_time_t dispatchTimeByDate(NSDate *date)
{
    NSTimeInterval interval = [date timeIntervalSince1970];
    double second;
    double subsecond = modf(interval, &second);
    
    struct timespec time;
    time.tv_sec = second;
    time.tv_nsec = subsecond * NSEC_PER_SEC;
    
    dispatch_time_t milestone = dispatch_walltime(&time, 0);
    
    return milestone;
}

@end
