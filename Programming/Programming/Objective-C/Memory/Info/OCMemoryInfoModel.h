//
//  OCMemoryInfoModel.h
//  Programming
//
//  Created by wangheping on 2021/11/5.
//  Copyright © 2021 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCMemoryInfoModel : NSObject

+ (long long)totalMemorySize;
+ (long long)getMemoryUsage;
+ (long long)getAvailableMemorySize;

@end

NS_ASSUME_NONNULL_END
