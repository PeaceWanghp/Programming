//
//  OCBlockWeakStrongObject.h
//  Programming
//
//  Created by wangheping on 2021/2/18.
//  Copyright © 2021 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCBlockWeakStrongObject : NSObject
- (void)selfBlock;
- (void)weakSelfBlock;
- (void)weakStrongSelfBlock;
@end

NS_ASSUME_NONNULL_END
