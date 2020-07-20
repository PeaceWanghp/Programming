//
//  OCMultiDelegateController.m
//  Programming
//
//  Created by Peace on 7/20/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCMultiDelegateController.h"

#import "OCMultiDelegate.h"
#import "OCMDView.h"
#import "OCMDObject.h"

@interface OCMultiDelegateController ()<OCMDViewDelegate>
{
    OCMultiDelegate * _multiDelegate;
    NSArray *_delegateTagets;
}
@end

@implementation OCMultiDelegateController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model appendItemTitle:@"111" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"222" target:self selector:@selector(todo)];
    [self.model appendItemTitle:@"333" target:self selector:@selector(todo)];
    
    OCMDView *view = [OCMDView new];
    view.delegate = self;
    OCMDObject *object = [OCMDObject new];
    _multiDelegate = [[OCMultiDelegate alloc] initWithArray:@[view,object]];
    self.tableView.delegate = _multiDelegate;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

- (void)todo {
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
