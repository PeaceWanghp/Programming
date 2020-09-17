//
//  OCBlockController+WeakStrong.h
//  Programming
//
//  Created by Peace on 9/16/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "OCBlockController.h"

NS_ASSUME_NONNULL_BEGIN

@interface OCBlockController (WeakStrong)

- (void)testStrong;
- (void)testWeak;
- (void)testWeakStrong;
    
@end

NS_ASSUME_NONNULL_END
