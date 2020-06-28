//
//  BPresentItemModel.m
//  Programming
//
//  Created by Peace on 6/18/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "BPresentItemModel.h"

@implementation BPresentItemModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _tag = -1;
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    _displayTitle = title;
}

- (void)selected {
    ++_tag;
    _displayTitle = [NSString stringWithFormat:@"%@ - %d",_title,_tag];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
