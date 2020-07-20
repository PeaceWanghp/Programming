//
//  OCMDView.m
//  Programming
//
//  Created by Peace on 7/20/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCMDView.h"

@implementation OCMDView

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    if (_delegate && [_delegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [_delegate scrollViewDidScroll:scrollView];
    }
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
