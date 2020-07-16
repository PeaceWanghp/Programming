//
//  OCMRCObject.h
//  Programming
//
//  Created by Peace on 7/15/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OCMRCObject : NSObject

@property (nonatomic,assign) NSInteger tag;

+ (void)selfRetain;
+ (void)notSelfRetain;
+ (void)objectAutorelease;

@end

NS_ASSUME_NONNULL_END
