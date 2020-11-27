//
//  OCLocksController.m
//  Programming
//
//  Created by Peace on 7/7/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCLocksController.h"

#import "BPWebViewController.h"

@interface OCLocksController ()

@end

@implementation OCLocksController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendOpenedHeader:@"区别："];
    [self.model appendItemTitle:@"自旋锁/互斥锁" target:self selector:@selector(linkWebView)];

    [self.model appendOpenedHeader:@"自旋锁优缺点:"];
    [self.model appendItemTitle:@"..." target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"互斥锁优缺点:"];
    [self.model appendItemTitle:@"..." target:self selector:@selector(todo)];
    
    [self.model appendOpenedHeader:@"锁分类："];
    [self.model appendItemTitle:@"OSSpinLock 自旋锁" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"pthread_mutex 互斥锁（C语言）" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"semaphore" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"NSLock 对象锁" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"NSRecursiveLock 递归锁" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"NSCondition 条件锁" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"NSConditionLock 条件锁" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"@synchronized 同步锁" target:self selector:@selector(todo)];
}

- (void)linkWebView {
    BPWebViewController *webView = [BPWebViewController webViewController:[NSURL URLWithString:@"https://www.jianshu.com/p/d69495dac8cb"]];
    [self.navigationController pushViewController:webView animated:YES];
}

@end
