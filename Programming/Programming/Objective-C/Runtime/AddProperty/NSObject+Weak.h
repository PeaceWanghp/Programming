//
//  NSObject+Weak.h
//  Programming
//
//  Created by Peace on 11/14/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Weak)

@property (nonatomic, weak) id weakObj;

@end

NS_ASSUME_NONNULL_END
