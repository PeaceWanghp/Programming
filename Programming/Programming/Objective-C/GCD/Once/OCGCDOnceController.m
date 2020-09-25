//
//  OCGCDOnceController.m
//  Programming
//
//  Created by Peace on 9/23/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCGCDOnceController.h"

#import "BPWebViewController.h"

@interface OCGCDOnceController ()

@end

@implementation OCGCDOnceController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"dispatch_once"];
    [self.model appendDarkItemTitle:@"使用" target:self selector:@selector(apply)];
    [self.model appendDarkItemTitle:@"底层实现" target:self selector:@selector(linkWebView)];
}

- (void)apply {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //创建单例、method swizzled或其他任务
    });
}

- (void)linkWebView {
    BPWebViewController *controller = [BPWebViewController webViewController:[NSURL URLWithString:@"https://xiaozhuanlan.com/topic/7916538240"]];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
