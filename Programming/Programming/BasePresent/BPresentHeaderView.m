//
//  BPresendHeaderView.m
//  Programming
//
//  Created by Peace on 6/18/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "BPresentHeaderView.h"

@interface BPresentHeaderView() {
    __block UIButton *_button;
}

@end

@implementation BPresentHeaderView

- (instancetype)initWithIdentifier:(NSString *)aIdentifier {
    self = [super initWithReuseIdentifier:aIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor = [UIColor yellowColor];
        CGRect rect = self.contentView.frame;
        rect.origin.x = 320 - 40;
        rect.origin.y = 0;
        rect.size.width = 40;
        rect.size.height = 20;
        [_button setFrame:rect];
        [_button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_button.titleLabel setFont:[UIFont systemFontOfSize:13]];
        [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_button];
        
        [[self.contentView subviews] enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[UIButton class]]) {
                _button = (UIButton *)obj;
            }
        }];
    }
    
    return self;
}

- (void)setIndex:(NSInteger)index {
    _button.tag = index;
}

- (void)setTitle:(NSString *)title {
    self.textLabel.text = title;
}

- (void)setSubTitle:(NSString *)subTitle {
    [_button setTitle:subTitle forState:UIControlStateNormal];
}

- (void)buttonAction:(UIButton *)button {
    _block(button.tag);
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
