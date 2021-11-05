//
//  OCMemoryInfoModel.m
//  Programming
//
//  Created by wangheping on 2021/11/5.
//  Copyright © 2021 Peace. All rights reserved.
//

#import "OCMemoryInfoModel.h"

#import <mach/mach.h>
#import <mach/mach_host.h>

@implementation OCMemoryInfoModel

+ (long long)totalMemorySize {
    long long totalMemorySize = [NSProcessInfo processInfo].physicalMemory;
    return totalMemorySize;
}

// 获取当前应用的内存占用情况，和Xcode数值相近
+ (double)getMemoryUsage {
    task_vm_info_data_t vmInfo;
    mach_msg_type_number_t count = TASK_VM_INFO_COUNT;
    if(task_info(mach_task_self(), TASK_VM_INFO, (task_info_t) &vmInfo, &count) == KERN_SUCCESS) {
        return (long long)vmInfo.phys_footprint;
    } else {
        return 0;
    }
}

+ (long long)getAvailableMemorySize {
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if (kernReturn != KERN_SUCCESS) {
        return 0;
    }
    
    long long availableMemorySize = ((vm_page_size * vmStats.free_count + vm_page_size * vmStats.inactive_count));
    return availableMemorySize;
}

@end
