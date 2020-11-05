//
//  OCThread.h
//  Programming
//
//  Created by Peace on 7/6/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCThread : NSObject

- (void)began;
- (void)startAlive;
- (void)addTask;
- (void)finish;

@end

NS_ASSUME_NONNULL_END
