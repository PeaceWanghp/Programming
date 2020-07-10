//
//  OCLoadInitializeObject.m
//  Programming
//
//  Created by Peace on 7/10/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCLoadInitializeObject.h"

@implementation OCLoadInitializeObject

+ (void)load {
    NSLog(@"%s",__func__);
    
    //load方法中使用swizzle
}

+ (void)initialize {
//    sleep(2);
    NSLog(@"%s",__func__);
    
    //做表处理工作，增加列，删除列等。
    //初始化一份数据，如：某些多处用到的变量。
}

@end
