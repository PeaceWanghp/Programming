//
//  CUItemEntity.m
//  Programming
//
//  Created by heping wang on 2023/3/29.
//  Copyright © 2023 Peace. All rights reserved.
//

#import "CUItemEntity.h"

@implementation CUItemEntity

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image overview:(NSString *)overview {
    self = [super init];
    if (nil != self) {
        _title = [title copy];
        _image = image;
        _overview = [overview copy];
    }
    return self;
}

@end
