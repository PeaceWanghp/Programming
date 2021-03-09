//
//  OCMessageObject.h
//  Programming
//
//  Created by wangheping on 2021/3/8.
//  Copyright © 2021 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OCMProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface OCMessageObject : NSObject <OCMProtocol>

@property (nonatomic,assign) int tag;

//Notification
- (void)addNotification;

//Delegate
@property (nonatomic,weak) id<OCMProtocol> delegate;
- (void)delegateAction;

//TargetAction
@property (nonatomic,weak) id target;
@property (nonatomic,assign) SEL action;
- (void)taAction;

//Block
@property (nonatomic,copy) void(^tapBlock)(int tag);
- (void)testBlockAction;

@end

NS_ASSUME_NONNULL_END
