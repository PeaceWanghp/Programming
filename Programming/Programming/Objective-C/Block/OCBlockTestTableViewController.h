//
//  OCBlockTestTableViewController.h
//  Programming
//
//  Created by wangheping on 2022/10/31.
//  Copyright © 2022 Peace. All rights reserved.
//

#import "BPresentController.h"

NS_ASSUME_NONNULL_BEGIN

@interface OCBlockTestTableViewController : BPresentController

@end

@interface OCBlockFirstTestObject : NSObject
@property (nonatomic, copy) void(^block1)(void);
@property (nonatomic, assign) int value;
- (void)testMethod;
- (void)test2Method;
@end

NS_ASSUME_NONNULL_END
