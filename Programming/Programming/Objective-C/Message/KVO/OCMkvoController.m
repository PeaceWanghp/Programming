//
//  OCMkvoController.m
//  Programming
//
//  Created by wangheping on 2021/3/12.
//  Copyright © 2021 Peace. All rights reserved.
//

#import "OCMkvoController.h"

#import "OCMessageObject.h"

@interface OCMkvoController ()
{
    OCMessageObject *_messageObject;
}
@end

@implementation OCMkvoController

#pragma mark -
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _messageObject = [OCMessageObject new];
    
    [self.model appendOpenedHeader:@"Option:"];
    [self.model appendDarkItemTitle:@"Add" target:self selector:@selector(addObserve)];
    [self.model appendDarkItemTitle:@"Action" target:self selector:@selector(optionAction)];
    [self.model appendDarkItemTitle:@"Remove" target:self selector:@selector(removeAction)];
}

- (void)dealloc {
    [self removeAction];
}

#pragma mark -
#pragma mark -- Observe
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)contex {
    NSLog(@"keyPath = %@",keyPath);
    NSLog(@"object = %@",object);
    NSLog(@"change = %@",change);
    NSLog(@"contex = %@",contex);
}

#pragma mark -
#pragma mark -- Action
- (void)addObserve {
    [_messageObject addObserver:self
                     forKeyPath:@"tag"
                        options:NSKeyValueObservingOptionNew|
                                NSKeyValueObservingOptionOld|
                                NSKeyValueObservingOptionInitial|
                                NSKeyValueObservingOptionPrior
                        context:nil];
}

- (void)optionAction {
    int count = arc4random_uniform(5) + 10;
    NSLog(@"--%d--",count);
    _messageObject.tag = count;
}

- (void)removeAction {
    [_messageObject removeObserver:self forKeyPath:@"tag"];
}

@end
