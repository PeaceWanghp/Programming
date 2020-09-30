//
//  HPDelayMonitor.h
//  Programming
//
//  Created by Peace on 9/28/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HPDelayMonitor : NSObject

@property (nonatomic,assign) BOOL isActiving;

//+ (instancetype)sharedInstance;

- (void)begin;
- (void)end;

@end

NS_ASSUME_NONNULL_END
