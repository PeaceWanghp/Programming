//
//  OCMemoryInfoController.m
//  Programming
//
//  Created by wangheping on 2021/11/5.
//  Copyright © 2021 Peace. All rights reserved.
//

#import "OCMemoryInfoController.h"

#import "OCMemoryInfoModel.h"

@implementation OCMemoryInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendDarkItemTitle:@"memory total" target:self selector:@selector(memoryTotal)];
    [self.model appendDarkItemTitle:@"memory usage" target:self selector:@selector(memoryUsage)];
    [self.model appendDarkItemTitle:@"memory free" target:self selector:@selector(memoryFree)];
}

- (void)memoryTotal {
    long long totalMemorySize = [NSProcessInfo processInfo].physicalMemory;
    NSString *value = [[self class] fileSizeToString:totalMemorySize];

    NSLog(@"Memory total: %@",value);
}

- (void)memoryUsage {
    long long usageSize = [OCMemoryInfoModel getMemoryUsage];
    NSString *value = [[self class] fileSizeToString:usageSize];
    NSLog(@"Memory usage: %@",value);
}

- (void)memoryFree {
    long long freeMemorySize = [OCMemoryInfoModel getAvailableMemorySize];
    NSString *value = [[self class] fileSizeToString:freeMemorySize];
    NSLog(@"Memory free: %@",value);
}

+ (NSString *)fileSizeToString:(unsigned long long)fileSize {
    NSInteger KB = 1024;
    NSInteger MB = KB*KB;
    NSInteger GB = MB*KB;

    if (fileSize < 10) {
        return @"0 B";
    } else if (fileSize < KB) {
        return @"< 1 KB";
    } else if (fileSize < MB) {
        return [NSString stringWithFormat:@"%.2f KB",((CGFloat)fileSize)/KB];
    } else if (fileSize < GB) {
        return [NSString stringWithFormat:@"%.2f MB",((CGFloat)fileSize)/MB];
    } else {
        return [NSString stringWithFormat:@"%.2f GB",((CGFloat)fileSize)/GB];
    }
}

@end

