//
//  OCTestExtern.h
//  Programming
//
//  Created by Peace on 7/13/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const OCTExternString;//正确
//NSString * const OCTExternString;//错误

@interface OCTestExtern : NSObject

@end

NS_ASSUME_NONNULL_END
