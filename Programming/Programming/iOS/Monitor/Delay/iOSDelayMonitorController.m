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
    
    [self.model appendOpenedHeader:@"Monitor:"];
    [self.model appendDarkItemTitle:@"begin" target:self selector:@selector(beginMonitor)];
    [self.model appendDarkItemTitle:@"end" target:self selector:@selector(cancleMonitor)];
}

#pragma mark -
#pragma mark -- UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_isDelay) {
//        sleep(3);
        __autoreleasing testAutoreleaseObject *obj = [testAutoreleaseObject new];
        for (int i=0; i<100000000; i++) {
            obj.tag = 5;
        }
    }
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

#pragma mark -
#pragma mark -- Monitor
- (void)createDelay {
    _isDelay = YES;
    [self.tableView reloadData];
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
