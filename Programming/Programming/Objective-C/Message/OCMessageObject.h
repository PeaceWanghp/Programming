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

//Delegate
@property (nonatomic,weak) id<OCMProtocol> delegate;
- (void)delegateAction;

@end

NS_ASSUME_NONNULL_END
