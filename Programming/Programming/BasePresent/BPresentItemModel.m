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
        self.tag = -1;
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    _title = [title copy];
    self.displayTitle = [title copy];
}

- (void)selected {
    ++self.tag;
    self.displayTitle = [NSString stringWithFormat:@"%@ - %d",self.title,self.tag];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
