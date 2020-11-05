//
//  OCJSPatchController.m
//  Programming
//
//  Created by Peace on 9/9/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCJSPatchController.h"

@interface OCJSPatchController ()

@end

@implementation OCJSPatchController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] init];
    [webView setFrame:self.view.frame];
    [self.view addSubview:webView];
       
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.jianshu.com/p/74f79e7cbd18"]]];
}

@end
