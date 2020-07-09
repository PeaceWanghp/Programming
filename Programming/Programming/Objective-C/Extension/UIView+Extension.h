//
//  UIView+Extension.h
//  Programming
//
//  Created by Peace on 7/9/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView ()

@property (nonatomic, assign) int testValue;
- (void)testMethod;
+ (void)testClassMethod;

- (CGFloat)x;
- (CGFloat)y;
- (CGFloat)width;
- (CGFloat)height;

@end

NS_ASSUME_NONNULL_END
