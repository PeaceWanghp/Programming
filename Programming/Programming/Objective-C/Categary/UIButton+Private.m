//
//  UIButton+Private.m
//  Objective-C
//
//  Created by peace on 2019/4/3.
//  Copyright © 2019 peace. All rights reserved.
//

#import "UIButton+Private.h"
#import <objc/runtime.h>

@implementation UIButton (Private)

static const void * tg_name = @"dog";

//属性的set和get方法的实现
#pragma mark - 字符串类型的动态绑定
/*
 OBJC_ASSOCIATION_ASSIGN assign
 OBJC_ASSOCIATION_RETAIN_NONATOMIC retain
 OBJC_ASSOCIATION_COPY_NONATOMIC copy
 OBJC_ASSOCIATION_RETAIN
 OBJC_ASSOCIATION_COPY
 */

//set方法的实现
- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, tg_name, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//get方法的实现
- (NSString *)name {
    return objc_getAssociatedObject(self,tg_name);
}

@end
