//
//  OCMProtocol.h
//  Programming
//
//  Created by wangheping on 2021/3/8.
//  Copyright © 2021 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol OCMProtocol <NSObject>

@optional
- (void)testDelegateTag:(int)tag;
- (void)testEntrustTag:(int)tag;

@end

NS_ASSUME_NONNULL_END
