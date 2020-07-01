//
//  CUFBView.m
//  Programming
//
//  Created by Peace on 7/1/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "CUFBView.h"

@implementation CUFBView

#pragma mark -
#pragma mark -- Life Cycle
- (instancetype)initFWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        
        [self addSubviews];
        
        [self addSliderTag:1 x:20 y:100 action:@selector(frameAction:)];
        [self addSliderTag:2 x:20 y:140 action:@selector(frameAction:)];
        [self addSliderTag:3 x:20 y:180 action:@selector(frameAction:)];
        [self addSliderTag:4 x:20 y:220 action:@selector(frameAction:)];
    }
    return self;
}

- (instancetype)initBWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        
        [self addSubviews];
        
        [self addSliderTag:1 x:20 y:100 action:@selector(boundsAction:)];
        [self addSliderTag:2 x:20 y:140 action:@selector(boundsAction:)];
        [self addSliderTag:3 x:20 y:180 action:@selector(boundsAction:)];
        [self addSliderTag:4 x:20 y:220 action:@selector(boundsAction:)];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

#pragma mark -
#pragma mark -- View
- (void)addSubviews {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    view.backgroundColor = [UIColor yellowColor];
    [self addSubview:view];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(120, 120, 100, 100)];
    view1.backgroundColor = [UIColor greenColor];
    [self addSubview:view1];
}

- (void)addSliderTag:(int)tag x:(float)x y:(float)y action:(SEL)action {
    UISlider *slider = [[UISlider alloc] init];
    slider.tag = tag;
    slider.minimumValue = 0;
    slider.maximumValue = 10;
    slider.value = 5;
    CGRect rect = slider.frame;
    rect.origin.x = x;
    rect.origin.y = y;
    slider.frame = rect;
    [slider addTarget:self action:action forControlEvents:UIControlEventValueChanged];
    [self addSubview:slider];
}

#pragma mark -
#pragma mark -- Action
- (void)frameAction:(UISlider *)slider {
    CGRect rect = self.frame;
    self.frame = [self offsetRect:rect slider:slider];
    
    NSLog(@"\n修改坐标----> frame: %@, bounds:%@", NSStringFromCGRect(self.frame),NSStringFromCGRect(self.bounds));
}

- (void)boundsAction:(UISlider *)slider {
    CGRect rect = self.bounds;
    self.bounds = [self offsetRect:rect slider:slider];
    
    NSLog(@"\n修改坐标----> frame: %@, bounds:%@", NSStringFromCGRect(self.frame),NSStringFromCGRect(self.bounds));
}

#pragma mark -
#pragma mark -- Move
- (CGRect)offsetRect:(CGRect)rect slider:(UISlider *)slider  {
    float offset = [self valueOffset:slider.value];
    switch (slider.tag) {
        case 1: rect.origin.x += offset; break;
        case 2: rect.origin.y += offset; break;
        case 3: rect.size.width += offset; break;
        case 4: rect.size.height += offset; break;
        default: break;
    }
    
    return rect;
}

- (float)valueOffset:(int)value {
    float offset;
    int move = 1;
    if (value > 5) {
        offset = (value - 5) * move;
    }
    else {
        offset = (5 - value) * -move;
    }
    
    return offset;
}

@end
