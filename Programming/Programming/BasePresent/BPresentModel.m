//
//  BPresentModel.m
//  Programming
//
//  Created by Peace on 6/18/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "BPresentModel.h"

@implementation BPresentModel

#pragma mark -
#pragma mark -- Life Cycle
- (instancetype)init {
    self = [super init];
    if (self) {
        _dataSource = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

#pragma mark -
#pragma mark -- Custom
- (void)appendHeader:(NSString *)title{
    [self appendHeader:title status:NO];
}

- (void)appendOpenedHeader:(NSString *)title{
    [self appendHeader:title status:YES];
}

- (void)appendHeader:(NSString *)title status:(BOOL)status {
    BPresentHeaderModel *headerModel = [[BPresentHeaderModel alloc] init];
    headerModel.title = title;
    headerModel.status = status;
    headerModel.items = [NSMutableArray array];
    
    [_dataSource addObject:headerModel];
}

- (void)appendItemWithTitle:(NSString *)title class:(Class)className {
    BPresentItemModel *itemModel = [[BPresentItemModel alloc] init];
    itemModel.title = title;
    itemModel.className = className;
    
    [self addItem:itemModel];
}

- (void)appendItem:(NSString *)title target:(id)target selector:(SEL)selector {
    BPresentItemModel *itemModel = [[BPresentItemModel alloc] init];
    itemModel.title = title;
    itemModel.target = target;
    itemModel.selector = selector;
    
    [self addItem:itemModel];
}

- (void)appendTagItemWithTitle:(NSString *)title target:(id)target selector:(SEL)selector {
    BPresentItemModel *itemModel = [[BPresentItemModel alloc] init];
    itemModel.title = title;
    itemModel.target = target;
    itemModel.selector = selector;
    itemModel.tag = 0;

    [self addItem:itemModel];
}

- (void)addItem:(BPresentItemModel *)itemModel {
    BPresentHeaderModel *headerModel = (BPresentHeaderModel *)_dataSource.lastObject;
    [headerModel.items addObject:itemModel];
}

@end
