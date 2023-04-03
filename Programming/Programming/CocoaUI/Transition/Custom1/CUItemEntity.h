//
//  CUItemEntity.h
//  Programming
//
//  Created by heping wang on 2023/3/29.
//  Copyright © 2023 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CUItemEntity : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *overview;
@property (nonatomic, strong) UIImage *image;

- (instancetype)initWithTitle:(NSString*)title image:(UIImage*)image overview:(NSString*)overview;

@end

NS_ASSUME_NONNULL_END
