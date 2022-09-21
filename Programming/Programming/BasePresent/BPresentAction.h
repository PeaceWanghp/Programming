//
//  BPresentAction.h
//  Programming
//
//  Created by wangheping on 2022/6/23.
//  Copyright © 2022 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BPresentAction : NSObject

@property (nonatomic,copy) void(^block)(NSInteger index);

- (void)tapHeaderAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
