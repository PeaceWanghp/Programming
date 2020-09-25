//
//  BPWebViewController.m
//  Programming
//
//  Created by Peace on 9/24/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "BPWebViewController.h"

@interface BPWebViewController ()
@property (nonatomic,strong) NSURL *url;
@end

@implementation BPWebViewController

+ (instancetype)webViewController:(NSURL *)url {
    return [[BPWebViewController alloc] init:url];
}

- (instancetype)init:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] init];
    [webView setFrame:self.view.frame];
    [self.view addSubview:webView];
    
    [webView loadRequest:[NSURLRequest requestWithURL:self.url]];
}

@end
