//
//  BPresentModel.m
//  Programming
//
//  Created by Peace on 6/18/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "BPresentModel.h"
#import <UIKit/UIKit.h>

@interface BPresentModel(){
    
}

@end

@implementation BPresentModel

#pragma mark -
#pragma mark -- Life Cycle
- (instancetype)init {
    self = [super init];
    if (self) {
        _groupDataSource = [[NSMutableArray alloc] initWithCapacity:0];
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
    if (_dataSource.count > 0) {
        return;
    }
    
    BPresentHeaderModel *headerModel = [[BPresentHeaderModel alloc] init];
    headerModel.title = title;
    headerModel.status = status;
    headerModel.items = [NSMutableArray array];
    
    [_groupDataSource addObject:headerModel];
}

- (void)appendItemWithTitle:(NSString *)title class:(Class)className {
    [self addItem:title class:className target:nil selector:nil];
}

- (void)appendDarkItemWithTitle:(NSString *)title class:(Class)className {
    BPresentItemModel *itemModel = [self addItem:title class:className target:nil selector:nil];
    itemModel.dark = YES;
}

- (void)appendItemTitle:(NSString *)title target:(id)target selector:(SEL)selector {
    [self addItem:title class:nil target:target selector:selector];
}

- (void)appendDarkItemTitle:(NSString *)title target:(id)target selector:(SEL)selector {
    BPresentItemModel *itemModel = [self addItem:title class:nil target:target selector:selector];
    itemModel.dark = YES;
}

- (void)appendTagItemWithTitle:(NSString *)title target:(id)target selector:(SEL)selector {
    BPresentItemModel *itemModel = [self addItem:title class:nil target:target selector:selector];
    itemModel.tag = 0;
}

- (void)appendDarkTagItemWithTitle:(NSString *)title target:(id)target selector:(SEL)selector {
    BPresentItemModel *itemModel = [self addItem:title class:nil target:target selector:selector];
    itemModel.tag = 0;
    itemModel.dark = YES;
}

- (BPresentItemModel *)addItem:(NSString *)title class:(Class)className target:(id)target selector:(SEL)selector {
    BPresentItemModel *itemModel = [[BPresentItemModel alloc] init];
    itemModel.title = title;
    itemModel.className = className;
    itemModel.target = target;
    itemModel.selector = selector;
    
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width, MAXFLOAT);
    CGRect rect = [itemModel.displayTitle boundingRectWithSize:size
                                                       options:NSStringDrawingUsesLineFragmentOrigin
                                                    attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                                       context:nil];
       
    if (rect.size.height > 20.0) {
        itemModel.height = rect.size.height+24;
    }
    else {
        itemModel.height = 44.0f;
    }
    
    if (_groupDataSource.count > 0) {
        BPresentHeaderModel *headerModel = (BPresentHeaderModel *)_groupDataSource.lastObject;
        [headerModel.items addObject:itemModel];
    }
    else {
        [_dataSource addObject:itemModel];
    }
    
    return itemModel;
}

@end
