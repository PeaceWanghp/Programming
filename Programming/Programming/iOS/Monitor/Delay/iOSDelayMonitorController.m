//
//  iOSDelayMonitorController.m
//  Programming
//
//  Created by Peace on 9/28/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "iOSDelayMonitorController.h"

#import "HPDelayMonitor.h"
#import "testAutoreleaseObject.h"

@interface iOSDelayMonitorController ()
{
    HPDelayMonitor *_monitor;
    BOOL _isDelay;
}

@end

@implementation iOSDelayMonitorController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"Delay:"];
    [self.model appendDarkItemTitle:@"Create" target:self selector:@selector(createDelay)];
    [self.model appendDarkItemTitle:@"Cancel" target:self selector:@selector(cancelDelay)];
    
    [self.model appendOpenedHeader:@"Monitor_Runloop:"];
    [self.model appendDarkItemTitle:@"begin" target:self selector:@selector(beginMonitor)];
    [self.model appendDarkItemTitle:@"end" target:self selector:@selector(cancleMonitor)];
    
    [self.model appendOpenedHeader:@"Monitor_DisplayLink:"];
    [self.model appendDarkItemTitle:@"..." target:self selector:@selector(todo)];
}

#pragma mark -
#pragma mark -- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"bbbbbbbb");
    return [super tableView:tableView numberOfRowsInSection:section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"aaaaaaaaaaaa");
//    if (_isDelay) {
////        sleep(3);
//        __autoreleasing testAutoreleaseObject *obj = [testAutoreleaseObject new];
//        for (int i=0; i<100000000; i++) {
//            obj.tag = 5;
//        }
//    }
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

#pragma mark -
#pragma mark -- Monitor
- (void)createDelay {
    _isDelay = YES;
    NSLog(@"1111");
    [self.tableView reloadData];
//    [self.tableView layoutIfNeeded];
    NSLog(@"2222");
}

- (void)cancelDelay {
    _isDelay = NO;
}

#pragma mark -
#pragma mark -- Monitor
- (void)beginMonitor {
    if (!_monitor) {
        _monitor = [HPDelayMonitor new];
        [_monitor begin];
    }
}

- (void)cancleMonitor {
    [_monitor end];
    _monitor = nil;
}

@end
