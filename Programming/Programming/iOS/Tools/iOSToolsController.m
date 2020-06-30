//
//  iOSToolsController.m
//  Programming
//
//  Created by Peace on 6/30/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "iOSToolsController.h"

@interface iOSToolsController ()

@end

@implementation iOSToolsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendItemWithTitle:@"图片下载器（基于NSURLSession）" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"DB管理器" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"空间管理器" class:[UIViewController class]];
    [self.model appendItemWithTitle:@"图片存储器" class:[UIViewController class]];
    
    self.tableView.tableHeaderView = nil;
    self.tableView.sectionHeaderHeight = 0;
}

@end
