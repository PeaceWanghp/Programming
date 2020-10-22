//
//  AlgorithmsController.m
//  Programming
//
//  Created by Peace on 7/21/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "AlgorithmsController.h"

@interface AlgorithmsController ()

@end

@implementation AlgorithmsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] init];
    [webView setFrame:self.view.frame];
    [self.view addSubview:webView];
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://blog.csdn.net/yeyazhishang/article/details/82353846"]]];
    
    /*
     描述算法复杂度时,常用O(1), O(log n), O(n), O(n log n), O(n^2), O(n^3), O(n^n):

     O(1):
     就是最低的时空复杂度了，也就是耗时/耗空间与输入数据大小无关，无论输入数据增大多少倍，耗时/耗空间都不变。 哈希算法就是典型的O(1)时间复杂度，无论数据规模多大，都可以在一次计算后找到目标（不考虑冲突的话）
    
     O(log n):
     当数据增大n倍时，耗时增大log n倍（这里的log是以2为底的，
     比如，当数据增大256倍时，耗时只增大8倍，是比线性还要低的时间复杂度）。
     二分查找就是O(log n)的算法，每找一次排除一半的可能，256个数据中查找只要找8次就可以找到目标。
     
     O(n):
     就代表数据量增大几倍，耗时也增大几倍。比如常见的遍历算法。

     O(n log n):
     就是n乘以logn，当数据增大256倍时，耗时增大256*8=2048倍。
     这个复杂度高于线性低于平方。归并排序就是O(nlogn)的时间复杂度。
      
     O(n^2):
     代表数据量增大n倍时，耗时增大n的平方倍，这是比线性更高的时间复杂度。
     比如冒泡排序，就是典型的O(n^2)的算法，对n个数排序，需要扫描n×n次。
    */
}

@end
