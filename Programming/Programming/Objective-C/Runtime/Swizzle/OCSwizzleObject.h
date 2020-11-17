//
//  OCSwizzleObject.h
//  Programming
//
//  Created by Peace on 11/17/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCSwizzleObject : NSObject

- (void)exchangeMethod1;
- (void)exchangeMethod2;

- (void)replaceMethod1;
- (void)replaceMethod2;

- (void)testImplementation;
- (void)testImplementation2;

- (void)testLog;

+ (void)exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2;

@end

NS_ASSUME_NONNULL_END
