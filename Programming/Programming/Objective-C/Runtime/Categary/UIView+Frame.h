//
//  UIView+Frame.h
//  Objective-C
//
//  Created by peace on 2019/4/3.
//  Copyright © 2019 peace. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Frame)

@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * badName;

- (CGFloat)x;
- (CGFloat)y;
- (CGFloat)width;
- (CGFloat)height;

- (NSInteger)retainCount;

@end

NS_ASSUME_NONNULL_END
