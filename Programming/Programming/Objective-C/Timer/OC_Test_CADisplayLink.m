//
//  OC_Test_CADisplayLink.m
//  Objective-C
//
//  Created by Peace on 12/2/19.
//  Copyright © 2019 peace. All rights reserved.
//

#import "OC_Test_CADisplayLink.h"
#import <UIKit/UIKit.h>

@interface OC_Test_CADisplayLink() {
    CADisplayLink *_dispalyLink;
}

@end

@implementation OC_Test_CADisplayLink

- (void)dealloc {
    NSLog(@"%s",__func__);
}

- (void)startLink {
    _dispalyLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(run:)];
    [_dispalyLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)run:(CADisplayLink *)displaylinkTimer {
    NSLog(@"%s-----%ld",__func__,displaylinkTimer.preferredFramesPerSecond);
}

- (void)cancel {
    //销毁定时器
    [_dispalyLink invalidate];
    _dispalyLink = nil;
}

@end
