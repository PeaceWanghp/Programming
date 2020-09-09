//
//  OCLockCompareController.m
//  Programming
//
//  Created by Peace on 9/7/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCLockCompareController.h"

@interface OCLockCompareController ()

@end

@implementation OCLockCompareController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIWebView *webView = [[UIWebView alloc] init];
    [webView setFrame:self.view.frame];
    [self.view addSubview:webView];
       
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.jianshu.com/p/d69495dac8cb"]]];
}

@end
