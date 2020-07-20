//
//  OCMDObject.m
//  Programming
//
//  Created by Peace on 7/20/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCMDObject.h"

#import <UIKit/UIKit.h>

@implementation OCMDObject

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
