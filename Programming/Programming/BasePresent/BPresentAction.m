//
//  BPresentAction.m
//  Programming
//
//  Created by wangheping on 2022/6/23.
//  Copyright © 2022 Peace. All rights reserved.
//

#import "BPresentAction.h"

#import <UIKit/UIKit.h>

@implementation BPresentAction

- (void)dealloc {
    NSLog(@"%s",__func__);
}

- (void)tapHeaderAction:(UITapGestureRecognizer *)sender {
    if (self.block) {
        self.block(sender.view.tag);
    }
}

@end
